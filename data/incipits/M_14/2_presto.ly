\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    a''2 f4 e8 d
    cis4 b!8 a b2
    a8 d d d cis c c c
    h b b b a g f e16 d
    e8 fis16 gis a4. \hA gis16 \hA fis \hA gis4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    R1
    r2 r8 g' g g
    fis f f f e4 a
    d,8 g g g cis,4 d~
    d8 c c h16 a \hA h2\trill
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    R1*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    R1*4
    r2 e'
  }
}

BassFigures = \figuremode {
  r1*4
  r2 <4>4 <_+>
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
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
