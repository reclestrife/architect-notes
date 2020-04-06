
public class LoopDetection {

    /**
    Solution 1 - use hash set, but space will be O(n)
    Solution 2 - use double pointers, space O(1), time is O(N + K) where 
    N is number of nodes without outside loop, K is number of nodes inside loop
     */
    public boolean hasLoop(ListNode head) {
        ListNode p = head;
        ListNode p2 = head;
        
        while (p != null && p2 != null && p2.next != null) {
            p = p.next;
            p2 = p2.next.next;
            if (p == p2) {
                return true;
            }
        }
        
        return false;
    }
}