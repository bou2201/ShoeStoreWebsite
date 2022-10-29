using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.Storage;
using ShoeStore.DataAccess.Data;
using ShoeStore.DataAccess.Repository.IRepository;

namespace ShoeStore.DataAccess.Repository;

public class Repository<T> : IRepository<T> where T : class
{
    protected readonly DataContext _context;
    protected DbSet<T> _dbSet;

    public Repository(DataContext context)
    {
        _context = context;
        this._dbSet = _context.Set<T>();
    }

    public async Task<List<T>> GetAllAsync(Expression<Func<T, bool>>? filter = null,
        bool disableTracking = true,
        Expression<Func<T, object>>? orderBy = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>>? include = null, int take = -1)
    {
        IQueryable<T> query = _dbSet;
        if (disableTracking)
        {
            query = query.AsNoTracking();
        }

        if (include != null)
        {
            query = include(query);
        }

        if (filter != null)
        {
            query = query.Where(filter);
        }

        if (orderBy != null)
        {
            return take > 0
                ? await query.OrderBy(orderBy).Take(take).ToListAsync()
                : await query.OrderBy(orderBy).ToListAsync();
        }

        return take > 0 ? await query.Take(take).ToListAsync() : await query.ToListAsync();
    }
    // public async Task<List<T>> GetAllAsync(Expression<Func<T, bool>>? filter = null,
    //     bool disableTracking = true,
    //     Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = null,
    //     Func<IQueryable<T>, IIncludableQueryable<T, object>>? include = null)
    // {
    //     IQueryable<T> query = _dbSet;
    //     if (disableTracking)
    //     {
    //         query = query.AsNoTracking();
    //     }
    //
    //     if (include != null)
    //     {
    //         query = include(query);
    //     }
    //
    //     if (filter != null)
    //     {
    //         query = query.Where(filter);
    //     }
    //
    //     if (orderBy != null)
    //     {
    //         return await orderBy(query).ToListAsync();
    //     }
    //     else
    //     {
    //         return await query.ToListAsync();
    //     }
    // }

    public async Task AddAsync(T entity)
    {
        await _dbSet.AddAsync(entity);
    }

    public void Remove(T entity)
    {
        _dbSet.Remove(entity);
    }

    public void RemoveRange(IEnumerable<T> entities)
    {
        _dbSet.RemoveRange(entities);
    }

    public void UpdateRange(IEnumerable<T> entities)
    {
        _dbSet.UpdateRange(entities);
    }

    public async Task<T?> FirstOrDefaultAsync(
        Expression<Func<T, bool>>? filter = null,
        bool disableTracking = true,
        Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>>? include = null)
    {
        IQueryable<T> query = _dbSet;
        if (disableTracking)
        {
            query = query.AsNoTracking();
        }

        if (include != null)
        {
            query = include(query);
        }

        if (filter != null)
        {
            query = query.Where(filter);
        }

        if (orderBy != null)
        {
            return (await orderBy(query).FirstOrDefaultAsync())!;
        }
        else
        {
            return (await query.FirstOrDefaultAsync())!;
        }
    }

    public bool Any(Expression<Func<T, bool>>? filter = null)
    {
        return filter != null ? _dbSet.Any(filter) : _dbSet.Any();
    }
}