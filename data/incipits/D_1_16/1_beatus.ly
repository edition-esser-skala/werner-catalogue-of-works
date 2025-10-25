\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo · Largo"
    c'2\p e
    f e
    d c
    c a'
    d, c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo · Largo"
    e2\p g
    a g
    h g
    a d,4 c'
    h2 g
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo · Largo" \autoBeamOff
    r8 c^\solo e g c4 g8 c
    a a16 a h8 c c16 g g8 r16 g c g
    f8.[ g32 a] g8 d e16 e e8 c e
    fis fis fis a c8. c16 c8 h
    g g r h16 d g,8 g4 g8
  }
}

BassoLyrics = \lyricmode {
  Be -- a -- tus vir qui in --
  ven -- tus est si -- ne ma -- cu -- la, et qui post
  au -- rum non ab -- i -- it nec spe --
  ra -- vit in pe -- cu -- ni -- ae the --
  sau -- ris, quis est hic, et "lau -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo · Largo"
    c1~
    c
    h2 c
    a fis
    g e'
  }
}

BassFigures = \figuremode {
  r1
  <6 4>2 <5 3>
  <6 5>1
  <6\\>2 <5>
  r <6>
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
