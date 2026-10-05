-- CreateTable
CREATE TABLE "produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "categoria" TEXT,
    "estoque_atual" INTEGER NOT NULL DEFAULT 0,
    "criado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "vendas_historicas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produto_id" INTEGER NOT NULL,
    "data" DATETIME NOT NULL,
    "quantidade" INTEGER NOT NULL,
    CONSTRAINT "vendas_historicas_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "produtos" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "previsoes_demanda" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produto_id" INTEGER NOT NULL,
    "data_prevista" DATETIME NOT NULL,
    "quantidade_prevista" REAL NOT NULL,
    "gerado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "previsoes_demanda_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "produtos" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE INDEX "vendas_historicas_produto_id_data_idx" ON "vendas_historicas"("produto_id", "data");

-- CreateIndex
CREATE UNIQUE INDEX "vendas_historicas_produto_id_data_key" ON "vendas_historicas"("produto_id", "data");

-- CreateIndex
CREATE INDEX "previsoes_demanda_data_prevista_idx" ON "previsoes_demanda"("data_prevista");

-- CreateIndex
CREATE UNIQUE INDEX "previsoes_demanda_produto_id_data_prevista_key" ON "previsoes_demanda"("produto_id", "data_prevista");
