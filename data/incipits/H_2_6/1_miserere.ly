\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    r8 c'~\p c16 e g b a8\trill f\trill c\trill a\trill
    r4 r8 f' d16 e f8 e d
    cis16 d e8 f g a f,16 a c8 c,
    r2 a'16 b c b a8 g
    f16 g a g f8 e d4 r8 c'~
    c16 a' g f e f g8 c, f, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    r8 f\p g16 c8 e16 f8\trill c\trill a\trill f\trill
    r4 r8 a f8.\trill g32 a b16( a) b8
    e, e'16 d c!8 b a f16 a c8 c,
    r2 f16 g a g f8 e
    d16 e f e d8 c b4 r8 c'~
    c16 f e d c8 e, f4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    f4^\solo^\aDue g a a
    b a a g
    a r f g
    a a a2
    a4 a b g
    f e f g
  }
}

SopranoLyrics = \lyricmode {
  Mi -- se -- re -- re
  me -- i, De -- _
  us, se -- _
  cun -- dum ma --
  gnam mi -- se -- ri --
  cor -- _ di -- am
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    f4^\solo^\aDue g a a
    b a a g
    a r f g
    a a a2
    a4 a b g
    f e f g
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re
  me -- i, De -- _
  us, se -- _
  cun -- dum ma --
  gnam mi -- se -- ri --
  cor -- _ di -- am
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    f8-\solo a e c f,4 f'
    d8 e f d b2
    a4 a'8 g f a e c
    f16 a c b a8 g f16 g a g f8 e
    d16 e f e d8 c b g' e c
    a b c b a d b g
  }
}

BassFigures = \figuremode {
  r1
  <6>8 <\t> <3>4 <7> <6>
  <_+> <6 _!>2.
  r8 <\t>2..
  r1
  <6>4 <3> <6> <6 5>
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
