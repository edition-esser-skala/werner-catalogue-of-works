\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    R1*4
    r8 f' f f f4 r
    r2 r8 b b b
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    R1*4
    r8 a' d d d4 r
    r2 r8 d d d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    r2 c'4^\solo es~
    es8 es d c b4 h8 h
    cis[ d16 \hA cis] d2 cis4
    d r r8 d4 es!8
    f d es c d8. d16 d4
  }
}

SopranoLyrics = \lyricmode {
  Re -- _
  qui -- em ae -- ter -- nam, ae --
  ter -- _ _
  nam do -- na,
  do -- na e -- is, Do -- mi -- ne:
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 g'^\solo a2~
    a8 a g f es4 c
    r a'4. a8 g f
    e4 f8 f f4 e
    d r r8 f4 g8
    as f g a b8. b16 b4
  }
}

AltoLyrics = \lyricmode {
  Re -- _
  qui -- em ae -- ter -- nam,
  re -- qui -- em ae --
  ter -- nam, ae -- ter -- _
  nam do -- na,
  do -- na e -- is, Do -- mi -- ne,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4^\solo es4. es8 d c
    b4. a8 g4 r
    r2 d'4. d8
    cis e a,[ h] a2
    a4 r b2~
    b4 b b b
  }
}

TenoreLyrics = \lyricmode {
  Re -- _ qui -- em ae --
  ter -- _ nam,
  re -- qui --
  em ae -- ter -- _
  nam do --
  na e -- is,
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    g'4^\solo b4. b8 a g
    fis2 g4 g
    a f8 gis a2
    d,4 r r2
    R1
  }
}

BassoLyrics = \lyricmode {
  Re -- _ qui -- em ae --
  ter -- nam, ae --
  ter -- nam, ae -- ter --
  nam
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'2-\solo fis
    g c,
    d g
    a4 f!8 gis a2
    d, \clef tenor b'!~
    b b
  }
}

BassFigures = \figuremode {
  <5>4 <6> <7> <6>8 <5>
  <9>4 <8>8 r <7>4 <6>8 <5>
  <9 _+>4 <8>8 <7> <9 _->4 <8 _!>8 <7>
  <_+>4 <6>8 <7 5> <6 4>4 <5 _+>
  r2 <#(dotbf 5) #(dotbf 3)>4. <6 4>8
  <7- 5>4 <6 4>8 <7! 2> <8 3>2
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
