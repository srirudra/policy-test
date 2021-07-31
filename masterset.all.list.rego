package masterset.all.list

import input 

requiredPerms := {x | x := input.Resources.Requirements[_]}
userPerms := {x | x := input["permissions"][_]}
permsNotSatisfied := requiredPerms - userPerms
numberOfUnsatisfiedPerms := count(permsNotSatisfied)

result[msg] {
    numberOfUnsatisfiedPerms == 0
    msg :=  { "message": "All conditions met", "permitted": true }
}

result[msg] {
    numberOfUnsatisfiedPerms != 0
    msg :=  { "message": sprintf("Permissions Required: %v. User Permissions: %v. Permissions not satisfied: %v", [requiredPerms, userPerms, permsNotSatisfied]), "permitted": false }
}