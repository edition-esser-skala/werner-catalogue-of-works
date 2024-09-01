\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    c'2\p r16 c-! c-! c-! c-! c-! c-! c-!
    c4 r r16 fis fis fis fis fis fis fis
    g4 r8 d g,4 r8 g'
    c, r c r f, r d' r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    a'2\p r16 a-! a-! a-! a-! a-! a-! a-!
    a4 r r16 a-! a-! a-! a-! a-! a-! a-!
    d,4 r8 g e4 r8 e
    f r a r d, r b' r
  }
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    r8 f^\solo a c16 a f8 f r4
    r8 f16 g a8 b16 c d,8 d r4
    g8 g16 a b8 g16 f! e8 d16 c c'8. b16
    a[ c32 b c16 a] f[ a32 g a16 f] b,[ d'32 c d16 b] g[ b32 a b16 g]
  }
}

BassoLyrics = \lyricmode {
  Con -- cus -- sum est ma -- re
  et con -- tre -- mu -- it ter -- ra,
  u -- bi Arch -- an -- ge -- lus Mi -- cha -- el de -- scen --
  de -- _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    f2-\solo r16 f-! f-! f-! f-! f-! f-! f-!
    es4 r r16 d-! d-! d-! d-! d-! d-! d-!
    b4 r8 h c4 r8 c
    f r a, r b r g r
  }
}

BassFigures = \figuremode {
  r1
  <4 2>2 r16 <_+>4..
  <6>4. q8 r2
  r4 q2.
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
