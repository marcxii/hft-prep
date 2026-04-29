Lab 4: Consensus-Based Database Failover (Patroni + PostgreSQL)

The Setup: Build a 3-node PostgreSQL cluster managed by Patroni, utilizing a 3-node etcd cluster as the Distributed Configuration Store (DCS), and route traffic through HAProxy.

The Drill: Connect a client to the database through HAProxy. Then, intentionally crash the primary database by running systemctl stop postgresql on the leader node. Monitor the Patroni logs and etcd to observe the heartbeat timeout, the revocation of the leader lock, the election of a new primary, and HAProxy automatically rerouting the client traffic. Next, use iptables to block network traffic between the leader and replicas to test how Patroni handles a split-brain scenario.