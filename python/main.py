# Python script for statistical evaluation of the witnesses of commentary fragments

import csv
import numpy as np
import matplotlib.pyplot as plt

def getlistofwitnesses(table):
    listofwitnesses = []
    for row in table:
        listofwitnesses.append(row[0])
    listofwitnesses = listofwitnesses[1:]
    return listofwitnesses

def countoccurences(table, listofwitnesses):
    listofwitnesseswithoccurences = []
    for i in range(len(listofwitnesses)):
        occ = occurences(table[i])
        listofwitnesseswithoccurences.append([listofwitnesses[i], occ])
    return listofwitnesseswithoccurences

def occurences(row):
    lacuna = 0
    missing = 0
    witness = 0
    for position in row:
        if (position == 'x'):
            lacuna = lacuna + 1
        if (position == 'm'):
            missing = missing + 1
        if (position == 'a'):
            witness = witness + 1
    occurences = [lacuna, missing, witness]
    return occurences

def drawpiechartofoccurences(occurences):
    occ = np.array(occurences[1])
    lables = ['lacuna', 'missing', 'witness']
    colors = ['#f7e2a6', '#edb009', '#543f05']
    plt.pie(occ, labels=lables, colors=colors)
    plt.title(occurences[0])
    name = occurences[0] + '.png'
    plt.legend()
    plt.savefig(name)
    plt.show()
    plt.close(name)

def drawbarsofstatistics(manuscriptname, pairsofmanuscripts):
    pairs = []
    percentage = []
    for entry in pairsofmanuscripts:
        pairs.append(entry[0])
        percentage.append(entry[1] * 100)
    plt.rcParams["figure.figsize"] = (8, 5)
    plt.barh(pairs, percentage, color='#981414')
    plt.title(manuscriptname)
    name = manuscriptname + "-parr.png"
    plt.savefig(name)
    plt.show()
    plt.close(name)

def numberofmatchespercentage(table, listofwitnesses):
    tableasarray = np.array(table)
    resultpercentage = []
    for i in range(len(table)):
        nameofmanuscript = listofwitnesses[i]
        resultpercentagepermanuscript = []
        for k in range(len(table)):
            compared = nameofmanuscript + " - " + listofwitnesses[k]
            numberoffragments = len(table[i])
            matches = 0
            for j in range(len(table[i])):
                entry = tableasarray[i, j]
                neighbouringentry = tableasarray[k, j]
                if (neighbouringentry == 'x' or entry == 'x'):
                    numberoffragments = numberoffragments - 1
                else:
                    if (neighbouringentry == entry):
                        matches = matches + 1
            percentage = 0
            if (numberoffragments != 0):
                percentage = matches / numberoffragments
            resultpercentagepermanuscript.append([compared, percentage])
        resultpercentage.append([nameofmanuscript, resultpercentagepermanuscript])
    return resultpercentage



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    listofwitnesses = []
    with open('../ExpPs/csv/kollationstabelle-bezeugung.csv', newline='') as collationtable:
        reader = csv.reader(collationtable, dialect='excel', delimiter=';')
        table = []
        for row in reader:
            table.append(row)
        listofwitnesses = getlistofwitnesses(table)
    rawtable = []
    with open('../ExpPs/csv/kollationstabelle-bezeugung-without-headers.csv', newline='') as collationtablewithoutheadings:
        reader = csv.reader(collationtablewithoutheadings, dialect='excel', delimiter=';')
        for row in reader:
            rawtable.append(row)
    occurences = countoccurences(rawtable, listofwitnesses)
    for occs in occurences:
        drawpiechartofoccurences(occs)
    result = numberofmatchespercentage(rawtable, listofwitnesses)
    print(result)
    for manuscript in result:
        drawbarsofstatistics(manuscript[0], manuscript[1])