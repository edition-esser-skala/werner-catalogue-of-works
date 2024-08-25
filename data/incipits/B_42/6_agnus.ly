\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    e'4 e16 f g f e8 d c d
    e e r g a a r g~
    g g g fis g4 r
    R1
    \pa r8 g4 g8 \pd f4. f8
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c'8 g c d c[ g16 g] g8 g
    g g r e' c c r e
    d[ d c a'] d,4 r
    R1
    r2 d4. d8
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c8. c32 c c8 g c g16 g c8 g16 g
    c8 c r c16 c c8 c r c16 c
    g8 g c c16 c g4 r
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r8 g''\f c h c \tuplet 3/2 8 { d16 c h } c g8 f16
    e-! c-! e-! g-! c-! g-! e-! c-! a'-! f,-! a-! c-! f-! a-! g-! c-!
    h g8 g16 r c8 c16 \sbOn h16.\trill d64( h) g16.\trill h64( g) d16.\trill g64( d) h16.\trill d64( h) \sbOff
    g16-!\p h-! d-! g-! fis-! h,-! d-! f-! e-! g,-! c-! e-! d-! h'-! c,-! a'-!
    h,8 g'4\f g8 r f!4 f8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r8 e'4\f d8 e16 g8 d16 e8 d
    r16 c-! e-! g-! c-! g-! e-! c-! a' f, a c \sbOn f c \tuplet 3/2 8 { e d e }
    d h8 h16 c a'8 a16 d,16.\trill g64( d) h16.\trill d64( h) g16._[\trill h64( g) d16.\trill g64( d)] \sbOff
    h16-!\p d-! g-! h-! a-! d-! h-! d-! c-! e,-! g-! c-! h-! g-! a-! fis-!
    g4 r a8\f a b4~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    e'4.^\tutti d8 e[ d] c h
    c c r c c c r e
    d d c4 h r
    R1
    h8 h cis cis d4. d8
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:

  Mi -- se -- re -- re, mi -- "se -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    g'4^\tutti g g8 g4 g8
    g g r g a a r g
    g g g[ fis] g4 r
    R1
    r4 g8 g f2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:

  Mi -- se -- "re -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c4.^\tutti h8 c[ h] c d
    e e r e f f r e
    h h c[ a] d4 r
    R1
    r2 a8 a b4~
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:

  Mi -- se -- "re -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c4.^\tutti g'8 c[ g] e g
    c, c r c' f, f r c
    g' g a4 g r
    R1
    g4 e d4. d8
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:

  Mi -- se -- re -- re
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c4.-\tutti g'8 c g e g
    c,4. c'8 f,4. c8
    g'4 a g r
    g,8-\tasto r g r g r g r
    g'4-\org e d2
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r1
  r4 <7>8 <6\\> r2
  r1
  r4 <6\\> <8 5> <_ 6->
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
