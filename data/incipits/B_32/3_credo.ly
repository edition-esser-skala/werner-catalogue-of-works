\version "2.24.2"
\include "header.ly"

CornoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r8 \pa c'16 d e8 fis g g16 a h8 g
    a16 g a h c8 d g,4 r
    r g4. fis8 d f
    e16 f g4 g8 \pd g4 r
  }
}

CornoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r8 c'4 c8 d d16 d d4
    r8 f4 f8 f e16 d e g f e
    d8 g, r d' c4 d
    c8 d e4\trill d r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c,16 d e8 f g a h g
    c c16 d e8 fis g g,16 a h8 g
    a16 g a h c8 d g, c16 d e8 f
    g g,16 a h8 g c a' g f
    e16 f g4 c8 h16 g d h g h d g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c,16 d e8 f g a h g
    c c16 d e8 fis g g,16 a h8 g
    a16 g a h c8 d g, c16 d e8 f
    g g,16 a h8 g c a' g f
    e d c e d16 g d h g h d g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    f4^\tutti f'2 e4
    d8[ g,] g'4. fis8 d[ f]
    e[ d] e4 d r
  }
}

SopranoLyrics = \lyricmode {
  Cre -- _ do,
  cre -- _ _ do,
  cre -- _ do
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    c4^\tutti c'2 h4
    a2 g
    g4. d8 e[ a] g4
    g2 g8 d g g
  }
}

AltoLyrics = \lyricmode {
  Cre -- do,
  cre -- _ do,
  cre -- do, cre -- do,
  cre -- do in u -- num
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 g4^\tutti g'~
    g fis g g,
    r2 r8 c16[ d] e8[ f]
    g4 h, c d
    c8[ h] c4 h8 h g h
  }
}

TenoreLyrics = \lyricmode {
  Cre -- _
  do, cre -- do,
  cre -- _
  _ do, cre -- do,
  cre -- _ do in u -- num
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti c'2 h4
    a2 g
    r8 f16[ g] a8[ h] c c, c'4~
    c8[ h g h] a4 h
    c8[ g e c] g'4 r8 g,
  }
}

BassoLyrics = \lyricmode {
  Cre -- _ do,
  cre -- do,
  cre -- _ _ do, cre --
  _ do,
  cre -- do in
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4-\tutti c'2 h4
    a2 g
    r8 f16 g a8 h c c, c'4~
    c8 h g h a4 h
    c8 g e c g'4 r8 g,
  }
}

BassFigures = \figuremode {
  r2 <5 2>4 <6>
  <7> <6\\> <8 4> <\t 3>
  r2 <4>4 <3>
  <2>2 <7>8 <6\\> <5!>4
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor" "1, 2" }
        \partCombine #'(0 . 10) \CornoI \CornoII
      >>
    >>
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
