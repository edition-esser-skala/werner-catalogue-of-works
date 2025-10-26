\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro"
    R1
    r4 a'2 gis8 h
    h a c2 h8 a
    gis4. \trill fis?16 \hA gis a8 c16 h a4~
    a8 h16 a g4. a16 g f8 e
    d4 r r a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro"
    r4 d4. cis8 e4~
    e8 d f4. f8 e4
    e r r2
    R1
    r2 r4 d
    b' b8 b a e a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    R1
    r4 a'2 gis8[ h]
    h a c2 h8[ a]
    gis4. \trill fis?16[ \hA gis] a8 c16[ h] a4~
    a8[ h16 a] g4. a16[ g] f8[ e]
    d4 r r a'
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- ris
  Ma -- _ ter, Ma -- _
  _ _ _
  ter, quae
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    r4 d4. cis8 e4~
    e8 d f4. f8 e4
    e r r2
    R1
    r2 r4 d
    b' b8 b a e a4
  }
}

AltoLyrics = \lyricmode {
  Al -- ma Re --
  dem -- pto -- ris Ma --
  ter,

  quae
  per -- vi -- a coe -- li "por -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    R1
    a2 h
    c4. a8 f[ d] f'4~
    f e8[ d] c[ a] c4
    h2\trill a
    r4 g e'8 cis4 e8
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- _
  ris Ma -- _
  _ ter,
  quae per -- vi -- a
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    d2 e
    f4. f8 d4 e
    a, r d2
    e f4. c8
    d4 e cis d
    g8.[ f16] e8[ d] cis2
  }
}

BassoLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- _
  ris, al --
  ma Re -- dem --
  pto -- ris, Re -- dem --
  pto -- ris "Ma -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro"
    d2 e
    f4. f8 d4 e
    a4. f8 d2
    e f4. c8
    d4 e cis d
    g8. f16 e8 d cis2
  }
}

BassFigures = \figuremode {
  r2 <7>4 <6\\>
  <7> <6> <6 5> <_+>
  <9> <8> <7> <6>8 <5>
  <9 _+>4 \bassFigureExtendersOn <8 _+>8 <7 _+> \bassFigureExtendersOff r2
  <6 5>4 <_!> <6 5>2
  <_->4 <\t>2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
