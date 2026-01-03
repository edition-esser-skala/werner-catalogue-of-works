\version "2.24.2"
\include "header.ly"

Trombone = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \tempoMarkup "Adagio"
    d1
    R1*5
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio"
    R1
    d'4 r8 d f f f f
    e2 r
    c r4 r8 c
    des des des des des( c) c4~
    c b c r8 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio"
    R1
    as'2 r
    g r
    ges4 r8 es ges ges ges ges
    f4 r8 f g g es es
    f g16 as g8 f e4 r8 \hA e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    d'4 r8 d f f f f
    e2 r
    c r4 r8 c
    des des des des des[ c] c c
    c4 b c r8 c
  }
}

SopranoLyrics = \lyricmode {
  Ach! Ô un -- er -- hör -- te
  Sach!
  Ach! der --
  glei -- chen nie ge -- ſche -- hen, ge --
  ſche -- _ hen, es
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    as'2 r
    g r
    es4 r8 es ges ges ges ges
    f4 r8 f g g es es
    f[ g16 as] g8[ f] e4 r8 \hA e
  }
}

AltoLyrics = \lyricmode {
  Ach!
  Ach!
  Ach! Ô un -- er -- hör -- te
  Sach! der -- glei -- chen nie ge --
  ſche -- _ hen, es
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    f2 r
    c4 r8 c des des des des
    c2 r4 r8 c
    b b b b b4 as8 as
    as[ b16 c] des4 g, r8 g
  }
}

TenoreLyrics = \lyricmode {
  Ach!
  Ach! Ô un -- er -- hör -- te
  Sach! der --
  glei -- chen nie ge -- ſche -- hen, ge --
  ſche -- _ hen, es
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    h'2 r
    b r
    a! r4 r8 a
    b b b b es,4 as8 as
    des,2 c4 r8 c
  }
}

BassoLyrics = \lyricmode {
  Ach!
  Ach!
  Ach! der --
  glei -- chen nie ge -- ſche -- hen, ge --
  ſche -- hen, es
}

Continuo = {
  \relative c {
    \clef bass
    \key c \dorian \tempoMarkup "Adagio"
    R1
    h'2 r
    b r
    a! r4 r8 a
    b4. b8 es,4 as
    des,2 c4 r8 c
  }
}

BassFigures = \figuremode {
  r1
  <7- 5>
  <4! 2>
  <7- 5>2.. <\t \t>8
  <_->2 <7->8 <6>4.
  <7>4 <6> <_!>4. <\t>8
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "t-trb"
      \Trombone
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
