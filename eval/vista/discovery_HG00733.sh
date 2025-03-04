#!/bin/bash

# If you adapt this script for your own use, you will need to set these two variables based on your environment.
# SV_DIR is the installation directory for SVToolkit - it must be an exported environment variable.
# SV_TMPDIR is a directory for writing temp files, which may be large if you have a large data set.
export SV_DIR=`pwd`
SV_TMPDIR=./tmpdir
REFERENCE=../GRCh38_full_analysis_set_plus_decoy_hla.fa
inputType=bam
if [ ! -z "$1" ]; then
    inputType="$1"
fi

runDir=NA19240_run
inputFile=../NA19240.bam
sites=NA19240.discovery.vcf

# These executables must be on your path.
which java > /dev/null || exit 1
which Rscript > /dev/null || exit 1
which samtools > /dev/null || exit 1

# For SVAltAlign, you must use the version of bwa compatible with Genome STRiP.
export PATH=${SV_DIR}/bwa:${PATH}
export LD_LIBRARY_PATH=${SV_DIR}/bwa:${LD_LIBRARY_PATH}


classpath="${SV_DIR}/lib/SVToolkit.jar:${SV_DIR}/lib/gatk/GenomeAnalysisTK.jar:${SV_DIR}/lib/gatk/Queue.jar"

mkdir -p ${runDir}/logs || exit 1
mkdir -p ${runDir}/metadata || exit 1

Display version information.
java -cp ${classpath} ${mx} -jar ${SV_DIR}/lib/SVToolkit.jar

 java -Djava.io.tmpdir=/nonexistent -cp ${classpath} \
     org.broadinstitute.gatk.queue.QCommandLine \
     -S ${SV_DIR}/qscript/SVPreprocess.q \
     -S ${SV_DIR}/qscript/SVQScript.q \
     -cp ${classpath} \
     -gatk ${SV_DIR}/lib/gatk/GenomeAnalysisTK.jar \
     -configFile ${SV_DIR}/conf/genstrip_parameters.txt \
     -R $REFERENCE\
     -I ${inputFile} \
     -L autosomes.list \
     -ploidyMapFile gender.map \
     -runDirectory ${runDir} \
     -md ${runDir}/metadata \
     -jobLogDir ${runDir}/logs \
     -run -l DEBUG\
    || exit 1


# Run discovery.
 java -Djava.io.tmpdir=/nonexistent -cp ${classpath} \
     org.broadinstitute.gatk.queue.QCommandLine \
     -S ${SV_DIR}/qscript/SVDiscovery.q \
     -S ${SV_DIR}/qscript/SVQScript.q \
     -cp ${classpath} \
     -gatk ${SV_DIR}/lib/gatk/GenomeAnalysisTK.jar \
     -configFile ${SV_DIR}/conf/genstrip_parameters.txt \
     -R $REFERENCE\
     -I ${inputFile} \
     -md ${runDir}/metadata \
     -runDirectory ${runDir} \
     -genderMapFile NA19240_gender.map \
     -L autosomes.list \
     -jobLogDir ${runDir}/logs \
     -O ${sites} \
     -minimumSize 50 \
     -maximumSize 100000 \
     -run \
    || exit 1

