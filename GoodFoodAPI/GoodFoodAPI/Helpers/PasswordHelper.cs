﻿using System.Security.Cryptography;
using System.Text;

namespace GoodFoodAPI.Helpers
{
    public static class PasswordHelper
    {
        public static string ComputeHash(string password, string salt, int iteration)
        {
            if (iteration <= 0) return password;

            using var sha256 = SHA256.Create();
            var passwordSaltPepper = $"{password}{salt}";
            var byteValue = Encoding.UTF8.GetBytes(passwordSaltPepper);
            var byteHash = sha256.ComputeHash(byteValue);
            var hash = Convert.ToBase64String(byteHash);
            return ComputeHash(hash, salt, iteration - 1);
        }

        public static byte[] GenerateSalt()
        {
            using var rng = RandomNumberGenerator.Create();
            var byteSalt = new byte[64];
            rng.GetBytes(byteSalt);
            //var salt = Convert.ToBase64String(byteSalt);
            return byteSalt;
        }
    }
}
