package com.thomas.dao.db;

import com.thomas.dao.model.Collection;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CollectionMapper implements RowMapper<Collection> {
    @Override
    public Collection map(ResultSet rs, StatementContext ctx) throws SQLException {
        Collection collection = new Collection();
        collection.setId(rs.getInt("id"));
        collection.setCollectionName(rs.getString("collectionName"));
        collection.setCreateAt(rs.getDate("createdAt").toLocalDate());
        return collection;
    }
}
