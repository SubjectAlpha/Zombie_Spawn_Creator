local ZombieSpawnPoints = {

    { pos = Vector( 0, 0, 0 ) }, --Add as many as you like... Get the vectors by typing "getpos" in console.
}

function ZombieSpawns()

     timer.Create( "Respawner", 60, 10000, function() --Respawns every 60 seconds, after spawning 10,000 zombies it will stop.

        if ( numZombies < maxZombies ) then

            for k, v in pairs( ZombieSpawnPoints ) do

                    local zombie = ents.Create( "npc_" ) --Create whatever NPC you want it to here.
                    zombie:SetPos( v.pos )
					zombie:SetCustomCollisionCheck( true )
                    zombie:Spawn()
                    zombie:Activate()

                    numZombies = numZombies + 1

            end

        end

    end )
	
end

hook.Add( "ShouldCollide", "ZombieNoCollide", function( ent1, ent2 )

    if ( ent1:GetClass() == "npc_zombie" and ent2:GetClass() == "npc_zombie" ) then --Change the NPC to whatever you want.

        return false

    end

end )

hook.Add( "InitPostEntity", "StartZombieSpawning", ZombieSpawns )