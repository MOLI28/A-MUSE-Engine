// ==========================================
// A-MUSE INITIAL GRAPH SCHEMA
// Purpose: Define core entities and trust bonds
// ==========================================

// 1. CLEANUP (Optional: Uncomment to reset graph)
// MATCH (n) DETACH DELETE n;

// 2. CREATE CORE USER NODES
// Representing the legitimate ecosystem and a potential threat
CREATE (u:User {
    name: "Moli", 
    role: "Student", 
    location: "Banasthali",
    behavioral_risk: 0.05
})
CREATE (f:User {
    name: "Father", 
    role: "Income Tax Consultant",
    behavioral_risk: 0.02
})
CREATE (s:User {
    name: "Unknown_User", 
    role: "Potential Scammer",
    behavioral_risk: 0.85
})

// 3. ESTABLISH SOCIAL TRUST (The "Guardian" bond)
// This relationship is the primary signal for legitimate intent
CREATE (u)-[:TRUSTS {level: "High", relationship: "Family", verified_date: date()}]->(f)

// 4. LOG A TRANSACTION ATTEMPT
// This connects a trusted node to an untrusted node
CREATE (f)-[:TRANSFER_ATTEMPT {
    amount: 50000, 
    method: "UPI", 
    timestamp: datetime(),
    status: "Pending_Verification"
}]->(s)

// 5. VERIFICATION QUERY
// Use this to visualize the resulting graph
MATCH (n) RETURN n;