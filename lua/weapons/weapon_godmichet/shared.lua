sound.Add(
	{
		name = "prop_gathered",
		sound = "items/battery_pickup.wav",
		channel = CHAN_ITEM,
		pitch = 50,
		level = 50,
		volume = 0.7,
	}
)

SWEP.HoldType             = "knife"
SWEP.ViewModelFOV         = 70
SWEP.ViewModelFlip        = false
SWEP.UseHands             = false
SWEP.ViewModel            = "models/weapons/v_knife_t.mdl"
SWEP.WorldModel           = "models/weapons/w_knife_t.mdl"
SWEP.ShowViewModel        = true
SWEP.ShowWorldModel       = false
SWEP.Category            = "Ricky's weapons"
SWEP.UseHands             = true
SWEP.Spawnable            = true
SWEP.AdminSpawnable       = true

SWEP.Primary.Damage         = 50
SWEP.Primary.ClipSize       = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic      = false
SWEP.Primary.Delay          = 1.1
SWEP.Primary.Ammo           = "none"
SWEP.DrawAmmo         			= false

SWEP.ViewModelBoneMods = {
	["v_weapon.Knife_Handle"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}


--SWEP.WElements = {
	--["fente"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "gland", pos = Vector(0, -0.97, 0.05), angle = Angle(14.444, 0, 10), size = Vector(0.07, 0.2, 0.22), color = Color(0,0,0, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	--["right_ball"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 2.299, 7.407), angle = Angle(0, 112, 81.099), size = Vector(0.4, 0.4, 0.4), color = Color(255, 169, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	--["base"] = { type = "Model", model = "models/props_docks/dock01_pole01a_128.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.457, 1.48, -3.458), angle = Angle(7.777, -14.445, 0), size = Vector(0.2, 0.2, 0.1), color = Color(232,169,169, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	--["gland"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -7.5), angle = Angle(-180, 72.222, 81.111), size = Vector(0.27, 0.3, 0.27), color = Color(212,135,135, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	--["left_ball"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -2.3, 7.407), angle = Angle(0, 112, 81.099), size = Vector(0.4, 0.4, 0.4), color = Color(255, 169, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
--}

SWEP.WElements = {
	["right_ball"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 1, 7.407), angle = Angle(0, 112, 81.099), size = Vector(0.25, 0.25, 0.25), color = Color(255, 167, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["base"] = { type = "Model", model = "models/props_docks/dock01_pole01a_128.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.457, 1, -3.458), angle = Angle(7.777, -14.445, 0), size = Vector(0.119, 0.119, 0.119), color = Color(255, 168, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["gland+"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "gland", pos = Vector(0, -0.95, 0.1), angle = Angle(90, 0, 0), size = Vector(0.1, 0.1, 0.009), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["left_ball"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -1, 7.407), angle = Angle(0, 112, 81.099), size = Vector(0.25, 0.25, 0.25), color = Color(255, 167, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["gland"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0.05, -7.901), angle = Angle(180, 80, 76.666), size = Vector(0.15, 0.2, 0.15), color = Color(255, 135, 165, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["right_ball"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "v_weapon.knife_Parent", rel = "base", pos = Vector(0.2, 1, 6.42), angle = Angle(0, 0, 81), size = Vector(0.2, 0.2, 0.2), color = Color(255, 167, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["base"] = { type = "Model", model = "models/props_docks/dock01_pole01a_128.mdl", bone = "v_weapon.knife_Parent", rel = "", pos = Vector(0, -3, 2.469), angle = Angle(0, 0, 94.444), size = Vector(0.1, 0.1, 0.09), color = Color(255, 167, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["gland+"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "v_weapon.knife_Parent", rel = "base", pos = Vector(0.349, 0.259, -5.75), angle = Angle(0, 0, 90), size = Vector(0.05, 0.1, 0.009), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["gland"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "v_weapon.knife_Parent", rel = "base", pos = Vector(0, 0, -5.6), angle = Angle(0, 0, -97), size = Vector(0.128, 0.128, 0.128), color = Color(255, 135, 165, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["left_ball"] = { type = "Model", model = "models/props_junk/watermelon01.mdl", bone = "v_weapon.knife_Parent", rel = "base", pos = Vector(0.2, -1, 6.42), angle = Angle(0, 0, 81), size = Vector(0.2, 0.2, 0.2), color = Color(255, 167, 168, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}

SWEP.MoneyGap		 	 = 2000
SWEP.Power			   = 2500
SWEP.HitDistance 	 = 60
SWEP.WeaponDamage  = 34
SWEP.CooldownBill  = 0.5
SWEP.CooldownMelee = 0.3

function SWEP:PrimaryAttack()
			self:MeleeAttack()
			self:SetNextPrimaryFire(CurTime()+self.CooldownMelee)
end

function SWEP:MeleeAttack()
	--On prend en compte la latence avec un LagCompensation,
	self.Owner:LagCompensation( true )

  -- Distance entre owner et cible
	local tr = util.TraceLine( {
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
		filter = self.Owner,
		mask = MASK_SHOT_HULL
	} )

	-- Si la trace line/hull a rencontré une cible on joue un son.
	if ( tr.Hit && !( game.SinglePlayer() && CLIENT ) ) then
		--self:EmitSound(  )
	end

	local hit = false

	if ( SERVER && IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) ) then
		local dmg = DamageInfo()

		local attacker = self.Owner
		if ( !IsValid( attacker ) ) then attacker = self end
		dmg:SetAttacker( attacker )

		dmg:SetInflictor( self )
		dmg:SetDamage( self.WeaponDamage )

		tr.Entity:TakeDamageInfo( dmg )
		--self.Owner:TakeDamageInfo( dmg )
		hit = true

	end

  self.Owner:SetAnimation( PLAYER_ATTACK1 )
  self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )

	-- Ne pas oublier de le remettre à false car peux poser des problémes.
	self.Owner:LagCompensation( false )
end


function SWEP:SecondaryAttack()

	--if self.Owner.DarkRPVars.money >= self.MoneyGap then
  	--self:throw_money("models/props/cs_assault/money.mdl")
		--self:SetNextSecondaryFire(CurTime()+self.CooldownBill)
	--end
end

function SWEP:Reload()
	--self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
	--self:pull_player()
end

function SWEP:Think()

end


function onCollide(ent, table)
	local entity = table.HitEntity
  if entity:IsPlayer() then
    if SERVER then
			entity:SetVelocity(Vector(0,0,500))
      entity:addMoney(self.MoneyGap)
      SafeRemoveEntity(ent)
    end
  else
    if SERVER then
      timer.Simple( 2 ,  function() SafeRemoveEntity(ent) end )
    end
	end
end

function SWEP:pull_player()
	local tr = self.Owner:GetEyeTrace()
	if IsValid( tr.Entity ) then
		local phys = tr.Entity:GetPhysicsObjectNum( tr.PhysicsBone )

		local pushvec = tr.Normal * - 1000
		local pushpos = tr.HitPos

		tr.Entity:SetVelocity( pushvec )
	end
end


function SWEP:throw_money(model_file)

	local tr = self.Owner:GetEyeTrace()

	if (!SERVER) then return end

	local ent = ents.Create("prop_physics")
  ent:AddCallback("PhysicsCollide", onCollide)
	ent:SetModel(model_file)

  local leftHand = self.Owner:LookupBone("ValveBiped.Bip01_L_Hand")
  local leftHandPos, leftHandAng = self.Owner:GetBonePosition(leftHand)

	ent:SetPos(leftHandPos + leftHandAng:Up() * -30 + leftHandAng:Forward() * 28 )
	ent:SetAngles(self.Owner:EyeAngles())
	ent:Spawn()

	local phys = ent:GetPhysicsObject()

	if !(phys && IsValid(phys)) then ent:Remove() return end

	phys:ApplyForceCenter(self.Owner:GetAimVector() * self.Power)

  if (SERVER) then
    self.Owner:addMoney(-self.MoneyGap)
  end

	cleanup.Add(self.Owner, "props", ent)

	undo.Create ("Thrown_SWEP_Entity")
		undo.AddEntity (ent)
		undo.SetPlayer (self.Owner)
	undo.Finish()
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	self.Owner:SetNWFloat("nextAttackBill", CurTime() + self.CooldownBill)
	self.Owner:SetNWFloat("nextAttackMelee", CurTime() + self.CooldownMelee)
	return true
end

---------------- LUA CODE POUR LE CUSTOM MODEL -----------------

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
