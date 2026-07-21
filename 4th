<?php
// API endpoint define kiya
$requestUrl = "https://coderbyte.com/api/challenges/json/age-counting";

// Data fetch karke array mein decode kiya
$rawResponse = file_get_contents($requestUrl);
$responseObj = json_decode($rawResponse, true);

// Main string ko extract kiya
$dataStr = $responseObj['data'];

// String ko comma se break karke array banaya
$entries = explode(",", $dataStr);
$targetCount = 0;

// Har ek entry ko process karna
foreach ($entries as $entry) {
    // Extra spaces hatane ke liye trim use kiya
    $cleanEntry = trim($entry);
    
    // Key aur value ko separate karna
    $splitData = explode("=", $cleanEntry);
    
    // Sirf 'age' wali keys ko check karna
    if (isset($splitData[0]) && $splitData[0] === 'age') {
        $ageValue = (int)$splitData[1];
        
        // Condition check: age 50 ya usse zyada honi chahiye
        if ($ageValue >= 50) {
            $targetCount++;
        }
    }
}

// Final count print kar diya
echo $targetCount;
?>
