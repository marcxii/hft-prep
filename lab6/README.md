Lab 6: Microsecond Network Troubleshooting (Linux Kernel + tcpdump)

The Setup: Use the ethtool utility on your Linux instances to turn off adaptive interrupt moderation (adaptive-rx off adaptive-tx off) and force hardware coalescing timers to zero. Apply kernel network tuning using the sysctl command, specifically enabling net.ipv4.tcp_low_latency=1.  

The Drill: Practice analyzing traffic without GUI tools like Wireshark. Use tcpdump with flags like -tttt and -nn to capture traffic and analyze packet sequence numbers and timestamps with microsecond precision. Use the -ttt flag to calculate the exact time deltas between packets to measure your tuning improvements.