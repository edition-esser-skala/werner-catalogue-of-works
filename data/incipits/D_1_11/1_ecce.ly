\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Recitativo"
    r2 a''\p
    f es
    d a'~
    a d,
    c~ c4 a'8 f
    e4 d\trill c2 \bar "||"
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Recitativo"
    r2 c'~\p
    c c4. a8
    f2 r4 d'
    c4. a8 g2~
    g a4 c~
    c h c2 \bar "||"
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
    r8 c'4^\solo f8 f c a b16 c
    c8 f, a c es4. d8
    b b d4. a8 a a16 b
    c8 c es es16 d h8 h r d
    c8. g16 g g a b a4. h16 c
    c8 g r4 r2 \bar "||"
  }
}

SopranoLyrics = \lyricmode {
  Ec -- ce ho -- mo si -- ne quae --
  rel -- la ve -- rus De -- i
  cul -- tor ab -- sti -- nens se ab
  o -- mni o -- pe -- re ma -- lo et
  per -- ma -- nens in in -- no -- cen -- ti -- a
  su -- a.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Recitativo"
    f2 f,
    a a
    b fis'
    fis f
    e f
    g4 g, c2 \bar "||"
  }
}

BassFigures = \figuremode {
  r1
  <6>2 <5->
  r <6>
  <7- 5> <4!>
  <6>1
  <6 4>4 <5 _!>2.
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
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
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
