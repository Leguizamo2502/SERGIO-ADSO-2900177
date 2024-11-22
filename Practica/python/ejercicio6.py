"""pago"""
def calSalario(diaTra,valorDia):
    salario = diaTra* valorDia
    return salario

def calSalud(diaTra,valorDia):
    salud = calSalario(diaTra,valorDia) *0.12
    return salud

def calPension(diaTra,valorDia):
    pension = calSalario(diaTra,valorDia) *0.16
    return pension

def calArl(diaTra,valorDia):
    arl = calSalario(diaTra,valorDia) * 0.052
    return arl

def calDescuento(diaTra,valorDia):
    descuento = calSalud(diaTra,valorDia) + calPension(diaTra,valorDia) + calArl(diaTra,valorDia)
    return descuento

def calSubTransporte(diaTra,valorDia):
    if(calSalario(diaTra,valorDia)<(2*1300000)):
        subTransporte = 114000
    else:
        subTransporte = 0
    return subTransporte

def calRetencion(diaTra,valorDia):
    if(calSalario(diaTra,valorDia)>(4*1300000)):
        retencion = calSalario(diaTra,valorDia)*0.04
    else:
        retencion = 0
    return retencion

def calPagoTotal(diaTra,valorDia):
    pagoTotal = (calSalario(diaTra,valorDia)+calSubTransporte(diaTra,valorDia))-(calDescuento(diaTra,valorDia)+calRetencion(diaTra,valorDia))
    return pagoTotal


print(calPagoTotal(30,50000))