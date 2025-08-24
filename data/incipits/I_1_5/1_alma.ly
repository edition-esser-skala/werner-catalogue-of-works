\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r4 c'2 h4
    r d2 c4
    r h c8 a16 h c8 d
    g,4. a16 h c8 a c4
    c8 h h4 c8 h16 c d4
    g, r8 g a4 g~
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 r4 g'~
    g f r a~
    a g f2~
    f8 e16 d e2 fis4
    g d r2
    r4 g g8( f!) f4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c'2 h4
    r d2 c4
    r h c8 a16 h c8 d
    g,4. a16[ h] c8 a c4
    c8[ h] h4 c8 h16[ c] d4
    g, r8 g a4 g
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma
  Ma -- ter,
  quae per -- vi -- a coe -- li
  por -- ta ma -- nes et
  stel -- la, stel -- la ma --
  ris, et stel -- la,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 r4 g'~^\tutti
    g f r a~
    a g f2~
    f8[ e16 d] e2 fis4
    g d r2
    r4 g g8[ f!] f4
  }
}

AltoLyrics = \lyricmode {
  Al --
  ma Ma --
  ter, Ma --
  _ ter
  al -- ma,
  et stel -- la,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 g4. a8
    h[ c] d4 a4. h8
    c[ d] e2 d4~
    d c4. d16[ c] h8[ a]
    d4 r8 g, a[ g16 a] h8[ a16 h]
    c4 c, r d'
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma
  Ma -- ter, Re -- dem --
  pto -- ris Ma --
  _ _ _
  ter, et stel -- _
  _ la, et
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c4.^\tutti d8 e[ f] g4
    d4. e8 f[ g] a4
    r e a a8 h
    c c, c' h a2
    g4 g g8[ f!] f4
    e2 d4 h
  }
}

BassoLyrics = \lyricmode {
  Al -- ma Ma -- ter
  Re -- dem -- pto -- ris,
  quae per -- vi -- a
  coe -- li por -- ta ma --
  nes et stel -- la
  ma -- ris, et
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4.-\tutti d8 e f g4
    d4. e8 f g a4
    r e a4. h8
    c c, c' h a2
    g4 g4. f!8 f4
    e2 d4 h
  }
}

BassFigures = \figuremode {
  r1
  <6 4>4 <5 3>2.
  r4 <5> <6 5>2
  <9 4>4 <8 3> <5> <6\\>
  <4> <3><4 2>8 <\t \t> <6 4>4
  <6>2 <4>8 <3> <6 5>4
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
