using ASPAPI.Data;
using ASPAPI.Models;
using Microsoft.AspNetCore.Mvc;
namespace ASPAPI.Controllers;

[ApiController]
[Route("[controller]")]
public class SolarDataController : Controller
{
    private readonly ApplicationDbContext _context;
    private readonly ILogger<SolarDataController> _logger;
    
    public SolarDataController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet("insertData/{idmodule}/{voltagepanneau}/{voltageoutput}/{voltagebatterie}/{consommation}/{production}",
        Name = "insertData")]
    public IActionResult InsertData(int idmodule, double voltagepanneau, double voltageoutput, double voltagebatterie, double consommation, double production)
    {
        Module module = _context.Module.First(a => a.Id == idmodule);
        double capacitebatterie = _context.Batterie
            .First(a => a.Id == module.IdBatterie)
            .Valeur;
        Donnees donnees = new Donnees()
        {
            IdModule = idmodule,
            VoltagePanneau = voltagepanneau,
            VoltageOutPut = voltageoutput,
            VoltageBatterie = voltagebatterie,
            Production = production,
            Consommation = consommation,
            ValeurBatterie = (voltagebatterie * 100 ) / capacitebatterie,
            Temps = (DateTime.Now).ToUniversalTime()
        };
        _context.Add(donnees);
        _context.SaveChanges();
        return Ok($"success, time="+DateTime.Now);
    }

    [HttpGet("GetData/{idmodule}", Name = "GetData")]
    public List<Donnees> GetDonnees(int idmodule)
    {
        return _context.Donnnes.Where(a => a.IdModule == idmodule).ToList();
    }
}