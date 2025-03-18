print("ingrese nombre, apellido y materias")
nombre=input()
apellido=input()

#print(nombre, apellido)

print("ingrese cantidad de materias")
materias=input()
cantidad=int(materias)
suma=0
dicci={}
for i in range(cantidad):
    print("materia:") 
    materia=input()

    print("nota:")
    nota=input()
    notas=float(nota)
    dicci[materia]=notas
    
    suma += notas
promedio = suma/cantidad
print(nombre.capitalize(), apellido.upper())

print("Materias y Notas:")
for materia, notas in dicci.items():
    print(f"{materia}: {notas}")
print("")
print("Promedio",promedio)