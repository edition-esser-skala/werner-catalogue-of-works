\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    r4 a'4.\p h8 cis h16 cis
    d8 e fis e fis h fis gis
    a cis,16 d e8 fis g a h4
    a8 g fis4 e4. e8
    fis a\f d, fis a e a4~
    a8 a fis16 g a8 d,4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    r2 e4.\p e8
    fis g a h16 cis d4. cis16 h
    cis8 a16 h cis8 d e fis g fis
    e4 d4. cis16 h cis4
    r8 d\f d d cis e a, cis
    d16 e fis4 d h g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*4
    r8 d'^\tutti d d cis e a, cis
    d16[ e] fis4 d h8 h g
  }
}

SopranoLyrics = \lyricmode {
  Po -- tens in ter -- ra e -- rit
  se -- _ _ men e -- ius:
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*3
    r2 r8 a'^\tutti a a
    fis a d, fis a e a4~
    a8 a fis16[ g a8] d,4 r
  }
}

AltoLyrics = \lyricmode {
  Po -- tens in
  ter -- ra e -- rit se -- men e --
  ius, e -- ius:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*5
    r8 d^\tutti d d h d g, h
  }
}

TenoreLyrics = \lyricmode {
  Po -- tens in ter -- ra e -- rit
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'2^\solo cis8[ h] a[ g]
    fis e d cis h4. h8
    a4 g'8 fis e e e d
    cis4 d a2
    d4 r r8 a'^\tutti a a
    fis a d, fis g4. g8
  }
}

BassoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti -- met Do -- mi --
  num: In man -- da -- tis e -- ius
  vo -- let ni --
  mis. Po -- tens in
  ter -- ra e -- rit se -- men
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    d'8-\solo d,16 e fis8 g a4. g8
    fis e d cis h2
    a8 a' g! fis e4. d8
    cis4 d a2
    d4 r r8 a'-\tutti a a
    fis a d, fis g4. g8
  }
}

BassFigures = \figuremode {
  r1
  r2 <5>4. <6\\>8
  r2.. <6>8
  q <5>4. <4>4 <_+>
  r1
  r
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
