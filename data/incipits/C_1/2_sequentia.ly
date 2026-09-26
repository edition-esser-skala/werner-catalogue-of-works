\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    es4-\tutti f4. f8 f4~
    f8 es16-\solo d es8 g as16 g f4 es8
    d4 r r2
    r4 r8 g4-\tutti c8 as g16 f
    g2 fis8 fis g4~
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    \tiny g4-\tutti as4. as8 as4~
    as8 s2..
    s1
    r8 g-\tutti h d c4 f,
    des' c2 b4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    es'4-\tutti e f es8 d
    es4 r r8 g as g~
    g f16 e f2 e4
    f as8 g fis4 g
    e f2 es8 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c'4.-\tutti c8 c h16 a h4
    c r r2
    R1
    r4 d e f~
    f es d4. d8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti c8 c[ h16 a] h4
    c r r2
    r8 h4 d8 c[ h] c[ h16 a]
    h4 d e f~
    f es d4. d8
  }
}

SopranoLyrics = \lyricmode {
  Di -- es i -- _
  rae,
  di -- es il --
  la, di -- es il -- _
  la, di -- es
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    es4^\tutti f4. f8 f4~
    f8[ es] es4 r2
    r8 g4 f8 es16[ f g f] es[ d es8]
    d4 r8 g4 c8 as[ g16 f]
    g2 fis8 fis g4
  }
}

AltoLyrics = \lyricmode {
  Di -- _ es i --
  rae,
  di -- es il -- _
  la, di -- es il --
  la, di -- es "il -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g4^\tutti as4. as8 as4~
    as8[ g] g4 r2
    R1
    r8 g[ h] d c4 f,
    des' c2 b4
  }
}

TenoreLyrics = \lyricmode {
  Di -- _ es i --
  rae,

  di -- es il -- la,
  di -- _ es
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c4.^\tutti c8 d2
    c r
    R1
    r8 g'4 g8 c,4 des
    b c d g
  }
}

BassoLyrics = \lyricmode {
  Di -- es i --
  rae,

  di -- es il -- la,
  di -- es, di -- es
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c2-\tutti d
    c f
    g4 r fis-\tasto r
    g4. g8 c,4 des
    b c d g
  }
}

BassFigures = \figuremode {
  <5 3>4 <6- 4> <7 5- 3> <6! \t \t>
  <8 6- 4>8 <\t 5 _->4. <5 _->4 <6->8 <5>
  <_!>1
  q2 q4 <5>
  <6 5> <_-> <7 _+>2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
