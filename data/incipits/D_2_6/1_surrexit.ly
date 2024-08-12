\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \pa r16 c e g c g32 g g16 g e8 c r4
    r16 c e g c32 d e f g16 f e8 g g16 f e f \pd
    d d32 d d16 d d4 r r8 d
    e16 f e f e f e f \pa d8 d16 d d e fis g
    g4 fis\trill \pd g r8 g
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 r16 c e g c g32 g g16 g
    e8 c r e' c d c c
    g16 g32 g g16 g g4 r r8 g
    g c c16 d c d c8 c g e'
    d4. d8 d4 r8 d
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 r c r
    c r8 g c g16 g c8 c
    g16 g32 g g16 g g4 r r8 g
    c c16 c c8 c r2
    R1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c''16. g32 g16 g e8 d e e r4
    c'16. g32 g16 g e8 d e g4 c8
    h16 g d h g8 c a16 c h d c a' g f
    e8 g c a~ a d h c
    a4~ a16 d c d h g d h g d' h d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 c''16. g32 g16 g e8 d
    e e r h c h c e
    d16 h' g d h8 c a16 c h d c a' g f
    e8. e16 e8 e d4. e8
    d a' a a h16 g d h g d' h d
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 d'^\tutti e e r d
    e e r d e d c e
    d8. d16 d8 c a h c d
    e8. e16 e8 e d d d e
    d4. d8 d4 r8 d
  }
}

SopranoLyrics = \lyricmode {
  Sur -- re -- xit, sur --
  re -- xit, sur -- re -- xit Chri -- stus
  ho -- di -- e hu -- ma -- no pro so --
  la -- mi -- ne, hu -- ma -- no pro so --
  la -- mi -- ne, "sur -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 g'^\tutti g g r g
    g g r g g g g g
    g8. g16 g8 g f e16[ d] c8 g'
    g8. g16 a8 a a a g g
    g4 fis8.\trill fis16 g4 r8 g
  }
}

AltoLyrics = \lyricmode {
  Sur -- re -- xit, sur --
  re -- xit, sur -- re -- xit Chri -- stus
  ho -- di -- e hu -- ma -- no pro so --
  la -- mi -- ne, hu -- ma -- no pro so --
  la -- _ mi -- ne, "sur -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 h^\tutti c c r h
    c c r h c h c c
    h8. h16 h8 e c h a16[ f'] e[ d]
    c8. c16 c8 c4 c8 h[ c]
    a4. a8 h4 r8 h
  }
}

TenoreLyrics = \lyricmode {
  Sur -- re -- xit, sur --
  re -- xit, sur -- re -- xit Chri -- stus
  ho -- di -- e hu -- ma -- no pro so --
  la -- mi -- ne, pro so -- la --
  _ mi -- ne, "sur -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 g'^\tutti c c r g
    c c r g c g e c
    g'8. g16 g8 e f g a h
    c4 a fis8 fis[ g] c,
    d4. d8 g,4 r8 g'
  }
}

BassoLyrics = \lyricmode {
  Sur -- re -- xit, sur --
  re -- xit, sur -- re -- xit Chri -- stus
  ho -- di -- e hu -- ma -- no pro so --
  la -- mi -- ne, pro so --
  la -- mi -- ne, "sur -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4-\tutti r8 g' c c r g
    c c r g c g e c
    g'8. g16 g8 e f g a h
    c4 a fis g8 c,
    d4. d8 g,4 r8 g'
  }
}

BassFigures = \figuremode {
  r1
  r
  r4. <6>8 r2
  r <6 5>
  <4>4 <_+>2.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
      \Timpani
    }
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
