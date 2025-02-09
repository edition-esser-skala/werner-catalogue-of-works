\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Grave"
    f'4 r r a,~
    a g a cis8 e
    f f16 e d4. e16 f g8 f
    e f16 g f4~ f8 e16 d e4\trill
    \time 3/2 f2 r r
    r4 f c' b8 a g4 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Grave"
    a'4 r r f
    d4. d8 cis4 r
    r fis8 a b b16 a g4~
    g8 a16 b c8 b16 a g2
    \time 3/2 a4 c f e8 d c4 b
    a4 f r c' d2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Grave"
    a'8^\tutti f' c a f c' a f
    d4. d8 cis4 r
    r fis8 a b b16 a g4~
    g8 a16[ b] c8 b16[ a] g2
    \time 3/2 a2 r r
    R1.
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax, in ter -- ra,
  ter -- ra pax,
  pax ho -- mi -- ni -- bus bo --
  nae vo -- lun -- ta --
  tis.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Grave"
    f4^\tutti r r a,~
    a g a cis8 e
    f f16 e d4. e16[ f] g8 f
    e[ f16 g] f4. e16[ d] e4
    \time 3/2 f2 r r
    R1.
  }
}

AltoLyrics = \lyricmode {
  Et in __
  ter -- ra pax ho --
  mi -- ni -- bus bo -- nae vo -- lun --
  ta -- _ _ _
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Grave"
    c4^\tutti r r c
    f, b e,8 a4 cis8
    d d16 c b8 a g4. a16[ b]
    c8 b a[ g16 f] g4 c
    \time 3/2 c2 r r
    R1.
  }
}

TenoreLyrics = \lyricmode {
  Et in
  ter -- ra pax, pax ho --
  mi -- ni -- bus bo -- nae, bo -- nae
  vo -- lun -- ta -- _ _
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Grave"
    f4^\tutti r r f,
    b4. b8 a4 r
    r d8 fis g g16 f e8 d
    c4 c c2
    \time 3/2 f,2 r r
    R1.
  }
}

BassoLyrics = \lyricmode {
  Et in
  ter -- ra pax,
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta --
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Grave"
    f4-\tutti r r f,
    b2 a4 \clef tenor << { cis'8 e f f16 e } \\ { a,8 cis d d16 c } >>
    \clef bass d,8 fis g g16 f e8 d
    c2 c
    \time 3/2 f,2 d'-\solo e
    f a, b
  }
}

BassFigures = \figuremode {
  r1
  <7>4 <6> <_+>2
  r4 <6- _+>2.
  r4 <6 4> <5 \t> <\t 3>
  r2 <6> <6 5>
  r1.
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
