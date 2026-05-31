\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    f8^\solo c' \tuplet 3/2 8 { d16[ c b] a[ g f] } f8 e r g16 g
    a8[ g] a b a d4 b8
    b g c a a f b g
    c a d d c4 r8 a
  }
}

SopranoLyrics = \lyricmode {
  bo -- nae vo -- lun -- ta -- tis, be -- ne -- %2
  di -- ci -- mus te, ad -- o --
  ra -- mus, ad -- o -- ra -- mus te, glo --
  ri -- fi -- ca -- mus te, "glo -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    f8^\solo c d16[ f] e[ g] f8 e16[ d] c8. b16
    a4 r r r8 e'16 e
    f8[ e] fis g \hA fis4 g~
    g8 e c f4 d8 g e
    a f b16[ a] b8 a c f,4~
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus be --
  ne -- di -- ci -- mus te, ad --
  o -- ra -- _ mus te, glo --
  ri -- fi -- ca -- mus te, glo -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r8 g^\solo c4~
    c8.[ b16] a8 g d'4 b8. b16
    g8 c a8. a16 f8 b g c
    a d b16[ c] d[ e] f8. e16 d8 c
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- %2
  _ mus te, ad -- o --
  ra -- mus, ad -- o -- ra -- mus te, glo --
  ri -- fi -- ca -- mus te, lo -- ri -- "fi -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante"
    f8-\solo a b g d f e c
    d a b d c4 \clef tenor c'~
    c8. b16 a8 g d'4 b
    g8 c a4 f8 b g c
    a d b16 c d e f8. e16 d8 c
  }
}

BassFigures = \figuremode {
  r4. <6>4 q8 r4
  <5>8 <6>4. <4>8 <3> <5 3>4
  <6 4>8 <5 3> <6\\>4 <_+> <6>
  r <5>8 <6> r2
  r2.. <6>8
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
