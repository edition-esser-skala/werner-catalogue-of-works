\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    R1*5
    r8 g''\f g fis g4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    R1*5
    d'16\f h a g e'8 d d4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    h'8^\solo g a h c4. h8
    a4. gis8 a e'~ e16[ cis] a[ g]
    fis8 d d'4~ d16[ h a g] d'4~
    d16[ h a g] d'8.[ c16] h[ c d8] g,4~
    g16[ a32 h c16 a] \grace g8 fis4\trill g r
    r8 d'^\tutti e d d4 r
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _
  _ _ _
  _ tis.
  Lau -- da -- mus te,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*4
    r4 r8 d^\solo d16[ g fis e] d8. c16
    h8 g'^\tutti g fis g4 dis8^\solo e
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- _ mus
  te, lau -- da -- mus te, be -- "ne -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*5
    r8 d^\tutti c a h4 r
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- mus te,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 fis8^\solo d e fis g4~
    g8 f e8. d16 cis4 r
    r8 a'~ a16[ fis] d[ c] h8 h' a16[ fis e d]
    h'4 a16[ fis e d] g8[ fis] e16[ fis g8]
    c,16[ d e c] d4 g, r
    r8 h^\tutti c d g,4 r
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra pax __
  ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta --
  _ _ _ _
  _ _ tis.
  Lau -- da -- mus te,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g8-\solo g' fis d e fis g4~
    g8 f e8. d16 cis4 a8 \hA cis
    d4 fis8 d g, g' fis d
    g, g' fis d g fis e h
    c a d d, g g' fis d
    g h,-\tutti c d g, g' fis-\solo e
  }
}

BassFigures = \figuremode {
  r4. <6>8 q <5> <4> <3>
  <2>4 <4>8 <_+> r2
  r1
  r
  r4 <4>8 <3>4. r4
  r2. <6\\>4
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
