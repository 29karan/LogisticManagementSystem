-- CreateEnum
CREATE TYPE "Stage" AS ENUM ('BOOKED', 'DELIEVERED', 'SHIPPED', 'OUTFORDELIEVERY');

-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL,
    "pincode" TEXT NOT NULL,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShipmentParties" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ShipmentParties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shipment" (
    "id" TEXT NOT NULL,
    "senderId" TEXT NOT NULL,
    "recieverId" TEXT NOT NULL,
    "stage" "Stage" NOT NULL DEFAULT 'BOOKED',

    CONSTRAINT "shipment_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "shipment" ADD CONSTRAINT "shipment_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "ShipmentParties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shipment" ADD CONSTRAINT "shipment_recieverId_fkey" FOREIGN KEY ("recieverId") REFERENCES "ShipmentParties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
