-- model : melonlauncher

SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {}

SWEP.Category = "Ricky's weapons"
SWEP.Spawnable = true
--SWEP.AdminOnly = true

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.HoldType = "rpg"
SWEP.ViewModelBoneMods = {
	["base"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["arm"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.WElements = {
	["melon"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "front", pos = Vector(0, 0, 5.432), angle = Angle(0, 0, 90), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 1.48), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-4.444, 0, 15.309), angle = Angle(90, 0, 0), size = Vector(0.029, 0.029, 0.533), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++++++++++++++"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -6.421), angle = Angle(0, 30, 0), size = Vector(0.09, 0.09, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d1++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 29.135), angle = Angle(0, 0, 180), size = Vector(0.164, 0.164, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -2.35), angle = Angle(0, 30, 0), size = Vector(0.111, 0.111, 0.111), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 20.246), angle = Angle(0, -1.111, 180), size = Vector(0.12, 0.12, 0.12), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 6.199), angle = Angle(0, 30, 0), size = Vector(0.109, 0.109, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d1++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 37.036), angle = Angle(0, 0, 180), size = Vector(0.164, 0.164, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base"] = { type = "Model", model = "models/props_phx/wheels/drugster_back.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "front", pos = Vector(0, 0, -31.112), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d1+"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 33.085), angle = Angle(0, 0, 180), size = Vector(0.164, 0.164, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 3.457), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d1+++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 31.111), angle = Angle(0, 0, 180), size = Vector(0.164, 0.164, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 2.469), angle = Angle(180, 0, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 18.271), angle = Angle(0, -1.111, 180), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 15.199), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 13.199), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -4.1), angle = Angle(0, 30, 0), size = Vector(0.111, 0.111, 0.111), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d1"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 35.062), angle = Angle(0, 0, 180), size = Vector(0.164, 0.164, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 19.259), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 11.199), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 21.235), angle = Angle(0, -1.111, 180), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -5.433), angle = Angle(0, 30, 0), size = Vector(0.164, 0.164, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 17.2), angle = Angle(0, 30, 0), size = Vector(0.13, 0.13, 0.13), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 7.9), angle = Angle(0, 30, 0), size = Vector(0.109, 0.109, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["front"] = { type = "Model", model = "models/props_trainstation/trashcan_indoor001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(18.271, 1.6, -9.601), angle = Angle(-103.334, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1+++++++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -0.494), angle = Angle(0, 30, 0), size = Vector(0.12, 0.12, 0.12), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1++++++"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 9.199), angle = Angle(0, 30, 0), size = Vector(0.109, 0.109, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["based1"] = { type = "Model", model = "models/Mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 25.184), angle = Angle(0, 30, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

local removeEntityTime = 5

local rightClickWhiteList = {
	"STEAM_0:0:81568440" -- Zero
}

function SWEP:PrimaryAttack()
  --if not IsFirstTimePredicted() then return end
  self.Weapon:SetNextPrimaryFire( CurTime() + 0.3 )

-- Call 'ThrowChair' on self with this model
  self:ThrowObject( "models/props_junk/watermelon01.mdl" )


end

function SWEP:SecondaryAttack()
	if not table.HasValue(rightClickWhiteList, self.Owner:SteamID()) then return end
	self:ThrowObject( "models/props_junk/watermelon01.mdl", true )

end

function OnCollide(ent,table)

  if SERVER then
    local explode = ents.Create("env_explosion")
    explode:SetPos(ent:GetPos())
    explode:SetOwner(ent.FPPOwner)
    explode:Spawn()
    explode:SetKeyValue( "iMagnitude", "200" )
    explode:Fire("Explode",0,0)
    explode:EmitSound( "weapon_AWP.Single", 400, 400 )

    timer.Simple( removeEntityTime ,  function() SafeRemoveEntity(ent) end )
  end

end

function OnCollideExplode(ent,table)
	SafeRemoveEntity(table.HitEntity)
end

function SWEP:ThrowObject(model, isDestructive)


  if ( CLIENT ) then return end

  	--
  	-- Create a prop_physics entity
  	--
  	local ent = ents.Create( "prop_physics" )

  	--
  	-- Always make sure that created entities are actually created!
  	--
  	if ( !IsValid( ent ) ) then return end

  	--
  	-- Set the entity's model to the passed in model
  	--
  	ent:SetModel( model)

  	--
  	-- Set the position to the player's eye position plus 16 units forward.
  	-- Set the angles to the player'e eye angles. Then spawn it.
  	--
  	ent:SetPos( self.Owner:EyePos() + ( self.Owner:GetAimVector() * 32 ) )
  	ent:SetAngles( self.Owner:EyeAngles() )
  	ent:Spawn()

		if isDestructive then
			ent:AddCallback("PhysicsCollide", OnCollideExplode)
		else
    	ent:AddCallback("PhysicsCollide", OnCollide)
		end

  	--
  	-- Now get the physics object. Whenever we get a physics object
  	-- we need to test to make sure its valid before using it.
  	-- If it isn't then we'll remove the entity.
  	--
  	local phys = ent:GetPhysicsObject()
  	if ( !IsValid( phys ) ) then ent:Remove() return end


  	--
  	-- Now we apply the force - so the chair actually throws instead
  	-- of just falling to the ground. You can play with this value here
  	-- to adjust how fast we throw it.
  	--
  	local velocity = self.Owner:GetAimVector() * 100000000000000
  	phys:ApplyForceCenter( velocity )
    ent:SetModelScale( ent:GetModelScale() * 1, 1 )
    --ent:SetCollisionBounds(ent:GetCollisionBounds() * 100,  ent:GetCollisionBounds() * 100 )

  	--
  	-- Assuming we're playing in Sandbox mode we want to add this
  	-- entity to the cleanup and undo lists. This is done like so.
  	--
  	cleanup.Add( self.Owner, "props", ent )

  	undo.Create( "Water_melon" )
  		undo.AddEntity( ent )
  		undo.SetPlayer( self.Owner )
  	undo.Finish()
end

function SWEP:Initialize()

	self:SetHoldType(self.HoldType)


	if CLIENT then

		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels

		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)

				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else

					vm:SetColor(Color(255,255,255,1))

					vm:SetMaterial("Debug/hsv")
				end
			end
		end

	end
end

function SWEP:Holster()

	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end

	return true
end
function SWEP:OnRemove()
	self:Holster()
end
if CLIENT then
	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()

		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end

		if (!self.VElements) then return end

		self:UpdateBonePositions(vm)
		if (!self.vRenderOrder) then

			self.vRenderOrder = {}
			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end

		end
		for k, name in ipairs( self.vRenderOrder ) do

			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial

			if (!v.bone) then continue end

			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )

			if (!pos) then continue end

			if (v.type == "Model" and IsValid(model)) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end

				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end

				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end

			elseif (v.type == "Sprite" and sprite) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

			elseif (v.type == "Quad" and v.draw_func) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()
			end

		end

	end
	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()

		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end

		if (!self.WElements) then return end

		if (!self.wRenderOrder) then
			self.wRenderOrder = {}
			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end
		end

		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end

		for k, name in pairs( self.wRenderOrder ) do

			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end

			local pos, ang

			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end

			if (!pos) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial

			if (v.type == "Model" and IsValid(model)) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end

				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end

				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end

			elseif (v.type == "Sprite" and sprite) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

			elseif (v.type == "Quad" and v.draw_func) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()
			end

		end

	end
	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )

		local bone, pos, ang
		if (tab.rel and tab.rel != "") then

			local v = basetab[tab.rel]

			if (!v) then return end

			pos, ang = self:GetBoneOrientation( basetab, v, ent )

			if (!pos) then return end

			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

		else

			bone = ent:LookupBone(bone_override or tab.bone)
			if (!bone) then return end

			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end

			if (IsValid(self.Owner) and self.Owner:IsPlayer() and
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r
			end

		end

		return pos, ang
	end
	function SWEP:CreateModels( tab )
		if (!tab) then return end
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then

				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end

			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite)
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then

				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)

			end
		end

	end

	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)

		if self.ViewModelBoneMods then

			if (!vm:GetBoneCount()) then return end

			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = {
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end

				loopthrough = allbones
			end

			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end

				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end

				s = s * ms

				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end

	end

	function SWEP:ResetBonePositions(vm)

		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end

	end


	function table.FullCopy( tab )
		if (!tab) then return nil end

		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v)
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end

		return res

	end

end
