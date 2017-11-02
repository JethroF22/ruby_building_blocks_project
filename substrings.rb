def substrings string, dict
    results = {}
    results_arr = []
    if string.split(" ").length > 1
        string.split(" ").each do |word|
            word = word.downcase
            puts word
            results_arr.push(substrings(word, dict)) 
        end
        results_arr.each do |result|
            result.each do |key, value|
                results[key] ||= 0
                results[key] += value
            end
        end
    else
        dict.each do |word|
            word = word.downcase
            if string[word]
                results[word] ||= 0
                results[word] += 1
            end
        end
    end
    results
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary) == { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }