﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using DRSN.Common;
using Org.BouncyCastle.Crypto.Digests;

namespace DRSN.Business_Application
{
    public class Block
    {
        Blockdataset bd = new Blockdataset();

        public int Index { get; set; }
        public DateTime TimeStamp { get; set; }
        public string PreviousHash { get; set; }
        public string Hash { get; set; }
        public string Data { get; set; }
        public int Nonce { get; set; } = 0;

        public Block(DateTime timeStamp, string previousHash, string data)
        {
            Index = bd.block;
            TimeStamp = timeStamp;
            PreviousHash = previousHash;
            Data = data;
            Hash = CalculateHash();
        }

        public string CalculateHash()
        {
            SHA256 sha256 = SHA256.Create();

            byte[] inputBytes = Encoding.ASCII.GetBytes($"{TimeStamp}-{PreviousHash ?? ""}-{Data}-{Nonce}");
            byte[] outputBytes = sha256.ComputeHash(inputBytes);

            return Convert.ToBase64String(outputBytes);
        }

        public void Mine(int difficulty)
        {
            var leadingZeros = new string('0', difficulty);
            while (this.Hash == null || this.Hash.Substring(0, difficulty) != leadingZeros)
            {
                this.Nonce++;
                this.Hash = this.CalculateHash();
            }
            bd.difficulty = difficulty.ToString();

            //insert difficulty in database
            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);
            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("difficultyupdate", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@block", Index);

                sqlcmd.Parameters.AddWithValue("@difficulty", difficulty.ToString());

                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }
}