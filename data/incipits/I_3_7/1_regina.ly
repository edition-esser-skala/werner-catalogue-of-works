\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key g \major \time 12/8 \tempoMarkup "Vivace"
    d'8 d d g d g d h d h g r
    r4 r8 a a a d a d a fis a
    fis d r r4 r8 a' a a fis16 g a g fis e
    d4 r8 d' d d h16 c d c h a g4 r8
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key g \major \time 12/8 \tempoMarkup "Vivace"
    r2. g'4. g4 g8
    g h g fis fis r r4 r8 fis4.
    a8 fis a e d e fis fis r r4 r8
    fis fis fis g16 a h a g fis g4 r8 g g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 12/8 \tempoMarkup "Vivace" \autoBeamOff
    d'8^\tutti d d g d g d h d h g r
    r4 r8 a a a d a d a fis a
    fis d r r4 r8 a' a a fis16[ g a g fis e]
    d4 r8 d' d d h16[ c d c h a] g4 r8
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re, lae -- ta -- re,
  re -- gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- re, al -- le -- lu -- ia, __
  _ al -- le -- lu -- ia, __ _
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 12/8 \tempoMarkup "Vivace" \autoBeamOff
    r2. g'4.^\tutti g4 g8
    g h g fis fis r r4 r8 fis4.
    a8 fis a e d e fis fis r r4 r8
    fis fis fis g16[ a h a g fis] g4 r8 g g g
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- re, re -- gi -- na, lae -- ta -- re,
  al -- le -- lu -- ia, __ _ al -- le -- "lu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 12/8 \tempoMarkup "Vivace" \autoBeamOff
    r2. h4.^\tutti h4 h8
    d h d d d r r4 r8 d4.
    d8 a d cis a cis d d r r4 r8
    d d d h16[ c d c h a] h4 r8 h h h
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- re, re -- gi -- na, lae -- ta -- re,
  al -- le -- lu -- ia, __ _ al -- le -- "lu -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 12/8 \tempoMarkup "Vivace" \autoBeamOff
    r2. g'4.^\tutti g4 g8
    h g h d d, r r4 r8 d4.
    d8 d fis a fis a d d, r d' d d
    h16[ c d c h a] g4 r8 g g g e16[ f g f e d]
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- re, re -- gi -- na, lae -- ta -- re, al -- le -- lu --
  ia, __ _ al -- le -- lu -- ia, __
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 12/8 \tempoMarkup "Vivace"
    d''8-!-\tutti d-! d-! g-! d-! g-! \clef bass g,,4. g4 g8
    h g h d d, r r4 r8 d4.
    d8 d fis a fis a d d, r d' d d
    h16 c d c h a g4 r8 g g g e16 f g f e d
  }
}

BassFigures = \figuremode {
  r1.
  r
  r4. <_+> r2.
  r1.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
