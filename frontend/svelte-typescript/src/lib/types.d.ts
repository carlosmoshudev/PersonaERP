export interface Person {
    person_id?: number;
    name: string;
    lastname: string;
    alias?: string;
    notes?: string;
    birthdate?: Date;
    location?: string;
    created?: Date;
    modified?: Date;
}

export interface Category {
    category_id?: number;
    name: string;
}

export interface Group {
    group_id?: number;
    name: string;
}

export interface Email {
    email_id?: number;
    person_id: number;
    address: string;
    type_id: number;
}

export interface Link {
    link_id?: number;
    person_id: number;
    url: string;
    type: string;
}

export interface Phone {
    phone_id?: number;
    person_id: number;
    phone: string;
    type_id: number;
}

export interface Type {
    type_id?: number;
    type: string;
}
