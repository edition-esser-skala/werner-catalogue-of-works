\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r8 d' c h c4 r
    r8 c h a h e4 d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    R1*2
    r2 r4 r8 fis
    h8. h16 a8 gis a4 r8 e
    a8. a16 g8 fis g4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d'4.^\solo d8 d d, r c'
    h e d c h8. c16 d4
    c8 h e g, g fis r4
    r8 d'^\tutti e e e r r4
    r8 c16 c d8 d16 d d8 r r4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis.
  Lau -- da -- mus te,
  be -- ne -- di -- ci -- mus te,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r4 r8 fis^\tutti
    h4 a8[ gis] a4 r8 e16 e
    a4 g8 fis g e4 d8
  }
}

AltoLyrics = \lyricmode {
  Lau --
  da -- mus te, be -- ne --
  di -- ci -- mus te, ad -- "o -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r8 a^\tutti d4~
    d8[ e16 d] c8[ h] c a16 a c4~
    c8[ d16 c] h8 a h4 r
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da --
  mus te, be -- ne -- di --
  ci -- mus te,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r8 h^\tutti e e a,4 r
    r8 a16 a d8 d16 d g,4 r
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- mus te,
  be -- ne -- di -- ci -- mus te,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g'8-\solo h a g fis g fis e
    d c h a g g' fis d
    e d c e d4 r
    r8 h-\tutti e e, a4 r
    r8 a d d, g g' fis4
  }
}

BassFigures = \figuremode {
  r2.. <6>8
  q q q <6\\>4. <6>4
  q8 q q <3> <4> <_+>4.
  r4 <6 4>8 <5 _+> r2
  r4 <6 4>8 <5 _+>4 <6>8 <7> <6>
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
