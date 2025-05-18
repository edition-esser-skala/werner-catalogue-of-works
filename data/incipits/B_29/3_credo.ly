\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r16 fis a fis d'8 a e a
    r16 fis a fis d'8 a h g'
    r16 fis a fis e a fis d \sbOn \tuplet 3/2 8 { cis d e d e fis }
    e32 a, h cis d e fis g a d, e fis g a h cis d d,, e fis g a h c
    d g, a h c d e fis \sbOff g16 d g h a e fis d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    r16 fis a fis d'8 a e a
    r16 fis a fis d'8 a h g'
    r16 fis a fis e a fis d \sbOn \tuplet 3/2 8 { cis d e d e fis }
    e32 a, h cis d e fis g a d, e fis g a h cis d d,, e fis g a h c
    d g, a h c d e fis \sbOff g16 d g h a e fis d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'8 d r d cis e
    d d r d h d
    a4 e'8 d cis[ d]
    cis cis[ d] e fis fis16 e
    d8 c h h e d
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si -- bi -- li -- um
  o -- mni -- um et in -- "vi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis8 fis r fis e a
    fis fis r a g g
    fis4 e8 fis a8.[ fis16]
    e8 e[ a] g fis fis16 fis
    g8 a d, g4 fis8
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si -- bi -- li -- um
  o -- mni -- um et "in -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    a8 a r a a a
    a a r d d d
    d a4 a8 a4
    a8 a8.[ h16] cis8 d a16 a
    h8 c d e4 a,8
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si -- bi -- li -- um
  o -- mni -- um et "in -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'8 d, r8 d a' a,
    d d r d g h
    d4 cis8 d a[ fis16 d]
    a8 a'16 g fis8 e d d'16[ c]
    h8 a g e[ cis!] d
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si -- bi -- li -- um o --
  _ mni -- um et __ "in -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4 r16 d fis d a' a, cis a
    d4 r16 d fis d g g, h g
    d'8[ d' cis d] a fis16 d
    a8 a'16 g fis8 e d d'16 c
    h8 a g e cis! d
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r2 <6 5>4
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
