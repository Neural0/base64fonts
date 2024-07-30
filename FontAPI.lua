if not isfile or not writefile or not delfile or not getcustomasset then error("executor not supported") return end
if not FONTNAME then error("FONTNAME/FONTDATA nil") return end

local FONTDATA = game:HttpGet("https://raw.githubusercontent.com/Neural0/base64fonts/main/" .. FONTNAME)

if not FONTDATA then error("name not found in repoisitory") end
local Http = game:GetService("HttpService")

function RegisterFont(Name: string, Weight: number, Style, Asset)
    if not isfile(Asset.Id) then writefile(Asset.Id, Asset.Font) end
    if isfile(Name .. ".font") then delfile(Name .. ".font") end
    local Data = {
        name = Name,
        faces = {
            {
                name = "Regular",
                weight = Weight,
                style = Style,
                assetId = getcustomasset(Asset.Id),
            },
        },
    }
    writefile(Name .. ".font", Http:JSONEncode(Data))
    return getcustomasset(Name .. ".font");
end
local Font = Font.new(RegisterFont(FONTNAME, 200, "normal", {
    Id = FONTNAME .. ".ttf",
    Font = crypt.base64.decode(FONTDATA)
}))

return Font
