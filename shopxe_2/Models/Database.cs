using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace shopxe_2.Models
{
    public partial class Database : DbContext
    {
        public Database()
            : base("name=Database")
        {
        }

        public virtual DbSet<admin> admins { get; set; }
        public virtual DbSet<hang> hangs { get; set; }
        public virtual DbSet<loai> loais { get; set; }
        public virtual DbSet<sanpham> sanphams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<admin>()
                .Property(e => e.ten)
                .IsUnicode(false);

            modelBuilder.Entity<hang>()
                .HasMany(e => e.sanphams)
                .WithOptional(e => e.hang1)
                .HasForeignKey(e => e.hang);

            modelBuilder.Entity<loai>()
                .HasMany(e => e.sanphams)
                .WithOptional(e => e.loai1)
                .HasForeignKey(e => e.loai);

            modelBuilder.Entity<sanpham>()
                .Property(e => e.gia)
                .HasPrecision(19, 4);
        }
    }
}
