\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e'2\p d4. h8
    g4. g16 a b4. b8
    a4 r r8 a a a
    a( gis) gis4 r8 e'\f e e
    e4 r r8 f f f
    fis4 r r8 e h g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    g'2~\p g4. d8
    d( c) c d e4. e8
    f4 r r8 c c c
    c( h) h4 r8 g'!\f g g
    g4 r r8 a a a
    a4 r r8 g4 e8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r8 b'4^\tutti b8 b[ a] a4
    r8 c!4 c8 c[ h] h4
  }
}

SopranoLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r8 c[^\solo e] g f[ d] h g16[ f']
    f8[ e] e16[ f] g[ a] b8 cis, cis4\trill
    d8 f a f dis2\trill
    e r
    r8 g4^\tutti g8 g[ f] f4
    r8 a4 a8 a[ g] g4
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    e4.^\tutti e8 d4 d
    fis4. fis8 e4 e
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 c'4.^\tutti c8
    cis,4 cis d'4. d8
    dis,4 dis e4.\p e8
  }
}

BassoLyrics = \lyricmode {
  Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c2-\solo h
    c4 c'8 b16 a g8 g g g
    f4 r fis8 fis fis fis
    e2 \mvTr c'4.\f-\tutti c8
    cis,2 d'4. d8
    dis,2 e4. e8
  }
}

BassFigures = \figuremode {
  r2 <5>
  <9 4>8 <8 3>4. <4\+ _->2
  <6> <6\\>
  <8 6 4>8 <\t 5 _+>4. r2
  <7- 5> <6- 4>8 <5 3>4.
  <7 5>2 <6 4>8 <5 3>4.
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
