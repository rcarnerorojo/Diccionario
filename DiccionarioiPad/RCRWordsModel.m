//
//  RCRWordsModel.m
//  DiccionarioOnline
//
//  Created by Ramón Carnero Rojo on 16/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRWordsModel.h"

@implementation RCRWordsModel

-(id)init{
    if (self = [super init]){
        
        NSURL *urlToFile = [[NSBundle mainBundle] URLForResource:@"Vocabwords" withExtension:@"txt"];
        _words = [NSDictionary dictionaryWithContentsOfURL:urlToFile];
    }
    
    return self;
}

-(NSArray *) letters{
    
    return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

-(NSString *) letterAtIndex: (NSInteger) aLetterIndex{
    
    return [[self letters] objectAtIndex:aLetterIndex];
}

-(NSString *) wordAtIndex:(NSInteger) aWordIndex
          inLetterAtIndex:(NSInteger) aLetterIndex{
    
    NSString *letter = [self letterAtIndex:aLetterIndex];
    NSArray *wordsThatStartWithLetter = [self.words objectForKey:letter];
    return [wordsThatStartWithLetter objectAtIndex:aWordIndex];
}

-(NSArray *) wordsAtIndex:(NSInteger)anIndex{
    
    NSString *letter = [[self letters] objectAtIndex:anIndex];
    return [[self.words objectForKey:letter] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

#pragma mark - Ejercicios María José

-(NSArray *) allLetters{
    
    return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

-(NSArray *) wordsTharStartWithLetter:(NSString *) aLetter{
    
    return [self.words objectForKey:aLetter];
}

-(NSString *) wordThatStartWithLetter:(NSString *) aLetter atIdenx: (NSUInteger) aRow{
    
    return [[self wordsTharStartWithLetter:aLetter] objectAtIndex:aRow];
}

@end
