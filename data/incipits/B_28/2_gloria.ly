\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r8 h'16\f c d e fis8 g g,16 a h cis d8
    e d4 cis8 d16 a' fis a h h, d fis
    g h e, g e c a c fis, fis' d fis d h g h
    e, e' c e a, c a c fis, h g e h e h dis
    e8 g16 fis e8 h e e'4 dis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r8 g'16\f a h c d8 e e,16 fis g a h8
    a a a4\trill a16 d fis a h h, d fis
    g h e, g e c a c fis, fis' d fis d h g h
    e, e'c  e a, c a c fis, h g e h e h dis
    e8 g16 fis e8 h e16 h' c a fis8. h16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'8.^\tutti c16 h4. a8 g4~
    g8 fis e8. e16 fis8 a h4~
    h8 g4 a fis g8~
    g e c'4 h h
    h8 g16[ a] \tuplet 3/2 8 { h16[ a g] a[ g fis] } g4 r
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax __
  ho -- mi -- ni -- bus bo -- nae __
  vo -- lun -- ta -- _
  tis, vo -- lun -- ta --
  tis. Lau -- da -- mus te,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 g'4.^\tutti fis8 e4~
    e8 d d cis d4 r8 fis
    e e4 e8 d2
    e4 a4. g8 fis4
    e8 e16[ fis] \tuplet 3/2 8 { g[ fis e] fis[ e dis] } e4 r
  }
}

AltoLyrics = \lyricmode {
  Et in ter --
  ra, ter -- ra pax bo --
  nae vo -- lun -- ta --
  tis, vo -- lun -- ta --
  tis. Lau -- da -- mus te,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 d4^\tutti d,8 g g16[ a] h4
    a a8. a16 a4 r8 d
    h c4 a h g8~
    g r r e' dis e4 \hA dis8
    e4 r h8 e e dis16 dis
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra pax
  ho -- mi -- ni -- bus bo --
  nae vo -- lun -- ta -- tis, __
  vo -- lun -- ta -- _
  tis. Be -- ne -- di -- ci -- mus
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti fis8 e4. d8
    cis d a8. a16 d4 r8 d
    e4 c d h
    c r8 a[ h] e h4
    e r e8 c' a h16 h
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus bo --
  nae vo -- lun -- ta --
  tis, vo -- lun -- ta --
  tis. Be -- ne -- di -- ci -- mus
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'4.-\tutti fis8 e4. d8
    cis d a4 d r8 d
    e4 c d h
    c r8 a h e h4
    e, r e'8 c a h
  }
}

BassFigures = \figuremode {
  r1
  <6 5>4 <4>8 <_+>2 <6>8
  <5> <6> <5> <6> <5> <6> <5> <6>
  r2 <7 _+>4 <4>8 <_+>
  r2. <6 5>8 <_+>
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
