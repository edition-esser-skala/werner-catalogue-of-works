\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*3
    h'8 d e a, h d4 cis8
    d d d16 d d8 c c e e16 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*3
    g'8 g16 g g8 fis g g16 g g8 e
    fis fis gis h e, a h h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r8 h'^\solo h8. a16 g8 e' d!16[ c] h[ a]
    h8 a16 g d'8. e16 c8 h a16 g fis e
    h'8 h r4 r2
    g8^\tutti g16 g g8 fis g16 g g g g8 e
    fis fis gis gis a a16 a h8 h
  }
}

SopranoLyrics = \lyricmode {
  Be -- a -- tus vir qui ti -- met
  Do -- mi -- num: In man -- da -- tis e -- ius vo -- let
  ni -- mis.
  Glo -- ri -- a et di -- vi -- ti -- ae in do -- mo
  e -- ius, et iu -- sti -- ti -- a e -- ius
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    dis16^\solo dis dis dis e8 fis g fis16 e d8 c
    h4 a g8 d'^\tutti d cis
    d d d16 d d8 e e e e16 e
  }
}

AltoLyrics = \lyricmode {
  Ge -- ne -- ra -- ti -- o re -- cto -- rum be -- ne -- di -- %3
  ce -- _ tur. Ex -- or -- tum
  est in te -- ne -- bris lu -- men re -- ctis: "Mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*3
    d8^\tutti d16 d e8 a, h16 h h h h8 a
    a a h h c! c16 c h8 h
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a et di -- vi -- ti -- ae in do -- mo %4
  e -- ius, et iu -- sti -- ti -- a e -- ius
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 e8^\solo e16 e fis8 fis
    g a h g a h c4
    h r r2
    g8^\tutti h,16 h c8 d! g16 g g g e8 a
    d, d h h' a a16 a gis8 gis
  }
}

BassoLyrics = \lyricmode {
  Po -- tens in ter -- ra
  e -- rit, e -- rit se -- men e --
  ius.
  Glo -- ri -- a et di -- vi -- ti -- ae in do -- mo
  e -- ius, et iu -- sti -- ti -- a e -- ius
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]"
    e8-\solo g dis h e4 fis
    g8 a h g a h c4
    h8 a g fis e4 fis
    g8-\tutti h, c d! g, g' e a
    d,4 h a gis
  }
}

BassFigures = \figuremode {
  r1
  r2 r8 <_+> <7> <6>
  <_+>2. <6!>8 <5>
  r2. <7>8 <_+>
  r4 <6\\>2.
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
