\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    d'2 d8 d g g
    e4. e8 f f g g
    f c f f e4 r
    r8 c c c f4 e8 e
    a4 d, r8 g e e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    a'2 b8 b h h
    c g c4. c8 c, c
    a'4. a8 g g g g
    c4 a d cis
    r8 d b b g g c c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'2 b8 b h h
    c g c4 c4. c8
    a4. a8 g g g g
    c4 a d cis
    r8 d b b g g c c
  }
}

SopranoLyrics = \lyricmode {
  Wür ſtim -- men dan ein --
  häl -- lig ein Lob und
  Danckh -- lied an weils Gott al --
  ſo ge -- fäl -- lig
  ſo preys ihm je -- der -- man, ſo
}

TenoreI = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d2 d8 d d d
    e4 e8 e f4 c
    c4. c8 c4 r
    r8 c c c f4 e
    d d r8 g e e
  }
}

TenoreILyrics = \lyricmode {
  Wür ſtim -- men dan ein --
  häl -- lig ein Lob und
  Danckh -- lied an
  weils Gott al -- ſo ge --
  fäl -- lig ſo preys ihm
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    f,2 f8 f g g
    g4 g8 g a4 g
    f4. f8 e4 r8 e
    e e a4 r8 a a a
    a4 g8 g c4. g8
  }
}

TenoreIILyrics = \lyricmode {
  Wür ſtim -- men dan ein --
  häl -- lig ein Lob und
  Danckh -- lied an weils
  Gott al -- ſo, al -- ſo ge --
  fäl -- lig ſo preys ihm
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d2 b8 b g g
    c4 c8 c' a4 e
    f4. f8 c4 r8 c
    c c f f d4 a'8 a
    fis4 g8 g e e c c
  }
}

BassoLyrics = \lyricmode {
  Wür ſtim -- men dan
  ein -- häl -- lig ein Lob und
  Danckh -- lied an weils
  Gott al -- ſo ge -- fäl -- lig, ge --
  fäl -- lig ſo preys ihm je -- "der -"
}

Continuo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    d2 b8 b g g
    c4. c'8 a a e e
    f f f, f c'4 r8 c
    c c f f d d a' a
    fis4 g8 g e e c c
  }
}

BassFigures = \figuremode {
  r2 <5>4 <_!>
  r2 <6>4 q
  r1
  r2. <_+>4
  <6> <_-> <6>2
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
        \set Staff.instrumentName = "T 1"
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
