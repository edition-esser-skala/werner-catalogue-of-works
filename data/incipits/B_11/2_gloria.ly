\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Ordinario"
    c'4 d c4. b8
    a16 h c4 \hA h8 c g4 c8
    a4 b c8 b16 a g4
    a r r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Ordinario"
    c'4 d c4. b8
    a16 h c4 \hA h8 c g4 c8
    a4 b c8 b16 a g4
    f r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Ordinario"
    c'4^\tutti d c4. b8
    a16[ h] c8 c \hA h c g4 c8
    a4 b c8[ b16 a] g4
    a8 c^\solo d e f4 e8 c
    d4. d16 d g,8 c4 b8
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _
  tis. Lau -- da -- mus te, be -- ne --
  di -- ci -- mus te, ad -- "o -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Ordinario"
    r2 f4^\tutti d8[ e]
    f g f8. f16 e4 r8 e~
    e a f4. f8 f[ e]
    f4 r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  Et in
  ter -- ra, ter -- ra pax bo --
  nae vo -- lun -- ta --
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Ordinario"
    r2 a4^\tutti r8 b
    c4 d g, r8 c~
    c c d4 c8[ d] c4
    c r8 g^\solo a h c4~
    c8[ h16 a] \hA h8 h c4 r
  }
}

TenoreLyrics = \lyricmode {
  Et in
  ter -- ra pax bo --
  nae vo -- lun -- ta --
  tis. Lau -- da -- mus, lau --
  da -- mus te,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Ordinario"
    r2 f4^\tutti g
    f8[ e] d4 c r8 c~
    c f d c16[ b] a8[ b] c4
    f, r r2
    r8 g'4^\solo f8 e16[ d c d] e[ f g e]
  }
}

BassoLyrics = \lyricmode {
  Et in
  ter -- ra pax bo --
  nae vo -- lun -- ta -- _
  tis.
  ad -- o -- ra -- \hy
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Ordinario"
    c''4-! d-! \clef bass f,, g
    f8 e d4 c r8 c~
    c f d c16 b a8 b c4
    << { f4. } \\ { \voiceThree f,4_\solo } >> e'8 d4 c8 a'
    g4. f8 e4 c
  }
}

BassFigures = \figuremode {
  r2. <5>8 <6>
  r4 <7>8 <6!> r2
  <6>4 q2 <4>8 <3>
  <5 3>4 <6> <5>8 <6!>4.
  <4>8 <_!>4. <6>2
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
        \set Staff.instrumentName = "b"
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
