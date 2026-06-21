\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    R1
    r4 r8 d g d h g
    h'\p h, h h' a16( d) fis( d) a( d) fis,( a)
    g8 g'4 g,8 fis4 r
    r8 a16\f h c d e fis g4 g,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    R1
    r4 r8 d g d h g
    g'\p g, g g' fis16( a) d( a) fis( a) d,( fis)
    e4. e8 d4 r
    r8 fis\f a fis d h r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 r8 d^\solo g h16[ a] g8 a
    h d16[ c] h8 a^\tutti h8. h16 h4
    d^\solo d8 d d d, d'4~
    d8[ cis16 h] \hA cis8.\trill cis16 d4 r
    r8 a16[^\tutti h] c[ d] e[ fis] g4 g,
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat, ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do --
  _ mi -- num,
  et ex -- ul -- ta -- vit,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r4 r8 d^\solo
    g h16[ a] g8 fis^\tutti g8. g16 g4
    R1*2
    r8 fis^\tutti a fis d h r4
  }
}

AltoLyrics = \lyricmode {
  Ma --
  gni -- fi -- cat, ma -- gni -- fi -- cat

  et ex -- ul -- ta -- vit,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r4 r8 d^\tutti d8. d16 d4
    R1*2
    r2 r8 g,16[^\tutti a] h[ c] d[ e]
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi -- cat

  et ex -- "ul -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r4 r8 d^\tutti g8. g16 g4
    R1
    r2 r8 d16[^\tutti e] fis[ g] a[ h]
    c2 h4 r
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat

  et ex -- ul --
  ta -- vit,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g8-\solo g' d h g4 r
    r r8 d'-\tutti g d h g
    R1
    r2 r8 d'16-\tutti e fis g a h
    c8 c c c h g r4
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  <6 4\+>
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
