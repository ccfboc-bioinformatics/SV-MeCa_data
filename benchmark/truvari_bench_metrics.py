import os
import sys

# Define SV callers and SV types
CALLERS = ['BD', 'DELLY', 'INSV', 'LUMPY', 'MANTA', 'PINDEL', 'TARDIS']
SVTYPES = ['DEL', 'INS']

def init_dict():
    # Initialize dict with TP, FP, FN, Precision, Recall, F1 for each caller and SVTYPE
    return {
        caller: {
            svtype: {
                'TP': 0,
                'FP': 0,
                'FN': 0,
                'Precision': 0.0,
                'Recall': 0.0,
                'F1': 0.0
            } for svtype in SVTYPES
        } for caller in CALLERS
    }

def calc_metrics(tp, fp, fn):
    precision = tp / (tp + fp) if (tp + fp) > 0 else 0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0
    f1 = (2 * precision * recall) / (precision + recall) if (precision + recall) > 0 else 0
    return precision, recall, f1

def process_file(filepath, dict_data, tp_or_fp):
    del_count = 0
    ins_count = 0

    with open(filepath) as f:
        for line in f:
            line = line.strip()
            if line.startswith('#') or not line:
                continue
            fields = line.split('\t')
            if len(fields) < 8:
                continue

            info = fields[7]

            svtype = None
            supp_vec = None
            info_parts = info.split(';')
            for part in info_parts:
                if part.startswith('SVTYPE='):
                    svtype = part.split('=')[1]
                elif part.startswith('SUPP_VEC='):
                    supp_vec = part.split('=')[1]

            if svtype not in SVTYPES:
                continue

            if tp_or_fp in ['TP', 'FP']:
                if supp_vec is None or len(supp_vec) != len(CALLERS):
                    continue

            # Count overall DEL and INS for this file (benchmark files won't have SUPP_VEC)
            if svtype == 'DEL':
                del_count += 1
            elif svtype == 'INS':
                ins_count += 1

            if tp_or_fp in ['TP', 'FP']:
                for i, char in enumerate(supp_vec):
                    if char == '1':
                        caller = CALLERS[i]
                        dict_data[caller][svtype][tp_or_fp] += 1

    return del_count, ins_count

def compute_metrics(results, benchmark_counts):
    for caller in CALLERS:
        for svtype in SVTYPES:
            tp = results[caller][svtype]['TP']
            fp = results[caller][svtype]['FP']
            # FN = benchmark total for this svtype - TP
            fn = benchmark_counts[svtype] - tp
            results[caller][svtype]['FN'] = fn

            precision = tp / (tp + fp) if (tp + fp) > 0 else 0
            recall = tp / (tp + fn) if (tp + fn) > 0 else 0
            f1 = (2 * precision * recall) / (precision + recall) if (precision + recall) > 0 else 0

            results[caller][svtype]['Precision'] = round(precision, 2)
            results[caller][svtype]['Recall'] = round(recall, 2)
            results[caller][svtype]['F1'] = round(f1, 2)

def main(folder):
    results = init_dict()

    # Paths to files
    tp_comp_file = os.path.join(folder, 'tp-comp.vcf')
    fp_file = os.path.join(folder, 'fp.vcf')
    tp_base_file = os.path.join(folder, 'tp-base.vcf')
    fn_file = os.path.join(folder, 'fn.vcf')

    # Check files exist before processing
    for f in [tp_comp_file, fp_file, tp_base_file, fn_file]:
        if not os.path.isfile(f):
            print(f"Missing required file: {f}")
            return

    # Process tp-comp and fp files to fill TP and FP counts
    tp_comp_del, tp_comp_ins = process_file(tp_comp_file, results, 'TP')
    fp_del, fp_ins = process_file(fp_file, results, 'FP')

    # Process benchmark files tp-base and fn (do NOT update dict, only count totals)
    tp_base_del, tp_base_ins = process_file(tp_base_file, results, None)
    fn_del, fn_ins = process_file(fn_file, results, None)

    # Total benchmark counts for DEL and INS (sum of tp-base + fn)
    benchmark_del = tp_base_del + fn_del
    benchmark_ins = tp_base_ins + fn_ins
    benchmark_counts = {'DEL': benchmark_del, 'INS': benchmark_ins}

    # Compute FN, Precision, Recall, F1 for each caller and svtype
    compute_metrics(results, benchmark_counts)

    # Print results
    print("Final counts per caller and SVTYPE:")
    for caller in CALLERS:
        print(f"Caller: {caller}")
        for svtype in SVTYPES:
            entry = results[caller][svtype]
            print(f"  {svtype}: TP={entry['TP']}, FP={entry['FP']}, FN={entry['FN']}, "
                  f"Precision={entry['Precision']}, Recall={entry['Recall']}, F1={entry['F1']}")
        print()

    print("Overall variant counts from files:")
    print(f"tp-comp DEL: {tp_comp_del}, INS: {tp_comp_ins}")
    print(f"fp DEL: {fp_del}, INS: {fp_ins}")

    print("Overall benchmark counts:")
    print(f"DEL: {benchmark_del}, INS: {benchmark_ins}")

    #del_fn = benchmark_del - tp_comp_del
    #ins_fn = benchmark_ins - tp_comp_ins

    #del_prec, del_rec, del_f1 = calc_metrics(tp_comp_del, fp_del, del_fn)
    #ins_prec, ins_rec, ins_f1 = calc_metrics(tp_comp_ins, fp_ins, ins_fn)

    #print("\nPerformance metrics by SVTYPE:")
    #print(f"DEL - Precision: {del_prec:.2f}, Recall: {del_rec:.2f}, F1: {del_f1:.2f}")
    #print(f"INS - Precision: {ins_prec:.2f}, Recall: {ins_rec:.2f}, F1: {ins_f1:.2f}")

if __name__ == '__main__':
    folder_path = sys.argv[1]  
    main(folder_path)
