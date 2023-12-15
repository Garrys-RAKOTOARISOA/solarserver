using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASPAPI.Models;

[Table("donnees")]
public class Donnees
{
    [Key]
    [Column("id")]
    public int Id { get; set; }
    
    [Column("idmodule")]
    [DisplayName("module")]
    public int IdModule { get; set; }
    
    [Column("voltagepanneau")]
    public double VoltagePanneau { get; set; }
    
    [Column("voltageoutput")]
    public double VoltageOutPut { get; set; }
    
    [Column("voltagebatterie")]
    public double VoltageBatterie { get; set; }
    
    [Column("production")]
    public double Production { get; set; }
    
    [Column("consommation")]
    public double Consommation { get; set; }
    
    [Column("valeurbatterie")]
    public double ValeurBatterie { get; set; }
    
    [Column("temps")]
    public DateTime Temps { get; set; }
    
    [ForeignKey("IdModule")]
    public virtual Module? Module { get; set; }
}