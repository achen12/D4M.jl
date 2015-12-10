#=

StrUnique

Get the unique and sorted single-character-separated sequences of strings.  
Also returns the mapping from the original ordering in the given sequence to the outputed sorted version.

Dev Note: 
 * TODO Current the backward mapping doesn't exist, but it doesn't seems to be utilized.

=#

function StrUnique(inputString::AbstractString, csv= false)
    #TODO backwardMapping from unique string to index is not implemented, because there doesn't seem to be a application for such an array
    #Note: The unique output is sorted.
    separator = inputString[end]
    if(csv == true)
        separator = ','
    end
    strA = split(inputString,separator)
    if inputString[end] == separator
        strA = strA[1:end-1]
    end

    uniqueSeq = unique(strA)
    sort!(uniqueSeq)
    if uniqueSeq[1] == "" #Handle Empty Case
        uniqueSeq = uniqueSeq[2:end]
    end

    forwardMapping =[ searchsortedfirst(uniqueSeq,x) for x in strA]

    backwardMapping = zeros(1,length(forwardMapping))

    return uniqueSeq,backwardMapping,forwardMapping
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################
