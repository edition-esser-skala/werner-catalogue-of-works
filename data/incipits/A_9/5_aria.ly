\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    c'2\f d4. e16 f
    c4 f, r8 b' b b
    a16 b c a f4 r8 f, f f \gotoBar "9"
    f'4 r r2
    r r8 b\p b b
    a16 b c a f4 r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1
    r8 f'\f f f e16 f g e b8 g'
    c, a'4 a8 f c4 a8 \gotoBar "9"
    f'4 r r2
    r8 f\p f f e16 f g e b8 e
    f4 r r2
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*2
    f2\f a4. b16 c \gotoBar "9"
    a4 r r2
    R1*2
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3 \gotoBar "9"
    c2 d4. e16[ f]
    c4 r8 f g16([ a] b4) b8
    a4 r8 a d,4 b'
  }
}

SoliLyrics = \lyricmode {
  Ô Menſch be --
  tracht! und nicht ver --
  acht, waß dich der
}

Continuo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante"
    f,8 f' f f b,4 b'~
    b a g2
    f r4 f \gotoBar "9"
    f,8 f' a, f b b' b b
    b4 a g2
    f8 f a f b16 c d b g a b g
  }
}

BassFigures = \figuremode {
  r1
  <5 2>4 <6>q2
  r1
  r1
  <5 2>4 <6> q2
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "St: Michael"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { }
}
