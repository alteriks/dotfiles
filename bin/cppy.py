#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import os

top_dir = "/sys/devices/system/cpu"
cpu_pattern = r'cpu(\d+)'
nominal_perf = 'acpi_cppc/nominal_perf'
highest_perf = 'acpi_cppc/highest_perf'
physical_core = 'topology/core_id'

cpu_aggregate = {}
for cpu in os.listdir(top_dir):
    cpu_match = re.match(cpu_pattern, cpu)
    if cpu_match:
        cpu_num = int(cpu_match.group(1))
        cpu_aggregate[cpu_num] = {'logical': cpu_num}
        with open(os.path.join(top_dir, cpu, nominal_perf), 'rb') as inFile:
            norm_value = inFile.readline()
            cpu_aggregate[cpu_num]['nominal_perf'] = int(norm_value.strip())
        with open(os.path.join(top_dir, cpu, highest_perf), 'rb') as inFile:
            high_value = inFile.readline()
            cpu_aggregate[cpu_num]['highest_perf'] = int(high_value.strip())
        with open(os.path.join(top_dir, cpu, physical_core), 'rb') as inFile:
            core_id = inFile.readline()
            cpu_aggregate[cpu_num]['physical'] = int(core_id.strip())


rows = sorted(list(cpu_aggregate.values()),
              key=lambda row: (row['physical'], row['logical']))

print("Maximum performance Percentage = "
      "Highest Performance Counter / Nominal Performance Counter\n")
for counters in rows:
    print("Physical CPU {phy_cpu}\t - Logical CPU {cpu}: \t"
          "{highest} / {norminal} * 100% = {mpp}%".format(
            cpu=counters['logical'],
            phy_cpu=counters['physical'],
            highest=counters['highest_perf'],
            norminal=counters['nominal_perf'],
            mpp=round(counters['highest_perf'] /
                      counters['nominal_perf'] * 100, 2)
        ))

